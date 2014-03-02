#
# Cookbook Name:: database
# Recipe:: thornwood
#
# Copyright 2012, Adam Brett. All Rights Reserved.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "database::mysql"

# Store this in a variable so we don't keep repeating it
mysql_connection_info = {
    :host => "localhost",
    :username => 'root',
    # automatically get this from the override_attributes call!
    :password => node['mysql']['server_root_password']
}

# create thornwood database
mysql_database 'thornwood' do
  connection mysql_connection_info
  action :create
end

# Create a mysql user but grant no privileges
mysql_database_user 'thornwood' do
  connection mysql_connection_info
  password   'UeOWq3SW'
  action     :create
end

# Grant SELECT, UPDATE, and INSERT privileges to all tables in foo db from all hosts
mysql_database_user 'thornwood' do
  connection    mysql_connection_info
  password      'UeOWq3SW'
  database_name 'thornwood'
  host          '%'
  privileges    [:all]
  action        :grant
end


# import an sql dump from your app_root/data/dump.sql to the my_database database
execute "import" do
  command "mysql -u root -p\"#{node['mysql']['server_root_password']}\" thornwood < /var/www/thornwood/data/thornwood.sql"
  action :run
end

