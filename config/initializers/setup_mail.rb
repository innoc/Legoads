# To change this template, choose Tools | Templates
# and open the template in the editor.
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "www.gmail.com",
  :user_name            => "legoadsteam@gmail.com",
  :password             => "legoadsteam50",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
