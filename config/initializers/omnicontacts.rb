# To change this template, choose Tools | Templates
# and open the template in the editor.
require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "478325861680.apps.googleusercontent.com", "MGYIjlMzaaVczW1vNoUdB1y1", {:redirect_path => "/oauth2callback", :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
end
