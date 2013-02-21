class Mailer < ActionMailer::Base
  def mail(template, contact)
    @recipients = contact[:email]
    @subject = 'www.legoAds.com'
    @from = 'innocent_akhidenor@yahoo.com'
    @body['text'] = template.message_body(:email, contact)
  end
end


