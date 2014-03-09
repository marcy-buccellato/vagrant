web_app "thornwoodcabinetry.com" do
  server_name "www.thornwoodcabinetry.com"
  server_aliases [ "*.thornwoodcabinetry.com", "thornwoodcabinetry.com" ]
  docroot "/var/www/thornwood"
  allow_override = 'All'
end