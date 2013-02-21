class Email < ActionMailer::Base
  default :from => "from@example.com"
   def registration_confirmation(message)
    @message= message 
    mail(:to => message.email, :subject => "www.legoAds.com", :from => "innocent_akhidenor@yahoo.com")
  end

   def keep_tabs_email(message)
    @message= message
    @tab_entry=Tab.find(@message.tab_id)
    mail(:to => @tab_entry.email, :subject => "www.legoAds.com", :from => "innocent_akhidenor@yahoo.com")
  end

 
end
