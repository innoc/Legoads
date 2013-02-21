class UserMailer < ActionMailer::Base


  def find_new_user(user)
    @user = user
    mail(:to =>@user.email, :subject => "An invite from #{user.user_name}", :from => "legoadsteam@gmail.com")
  end
end
