class MessagesController < ApplicationController

def view_message
  @user = User.find(session[:user_id])
  @new_friend_request=Partner.find(:all, :conditions=>["invited_id = ? and status= ?",@user.id,0])
  @friend=Partner.find(:all, :conditions=>["invited_id = ? and status= ?",@user.id,1])
end


def check_message 
@conversation = Conversation.find(params[:id])
@user= User.find(session[:user_id])
if request.post?
 @conversation = Conversation.find(params[:id])
 @message_id = Message.find(params[:message_id])
 if @user.id == @message_id.user_id
  @receiver = @message_id.receiver_id
 else
  @receiver = @message_id.user_id
 end
 @message=Message.new()
 @message.user_id = @user.id
 @message.receiver_id = @receiver
 @message.conversation_id = @conversation.id
 @message.subject = params[:subject]
 @message.body = params[:body]
 @message.status = "unread"
  if @message.save
   @notification = Notification.new()
   @notification.first_source = "message"
   @notification.user_id = @receiver
   @notification.reviewer_id = @user.id
   @notification.notification_flag = "unread"
   @notification.save
  end
  respond_to do |format|
     format.html{ redirect_to(:action=>'check_message',:id=>@conversation.id)}
     format.js
  end
end
  
end


def create_message
  @user = User.find(session[:user_id])
  @receiver = User.find(params[:id])
  @message = Message.new()
  if Message.exists?(@user,@receiver) == "no"
  @conversation = Conversation.new()
  @conversation.user_id = @user.id
  @conversation.receiver_id = @receiver.id
  @conversation.save
  @message.user_id = @user.id
  @message.receiver_id = @receiver.id
  @message.conversation_id = @conversation.id
  @message.subject = params[:subject]
  @message.body = params[:body]
  @message.status = "unread"
  else
  @message_getter = Message.find(:first,:conditions=>["user_id=? && receiver_id=? or user_id=? && receiver_id=?",@user, @receiver,@receiver,@user])
  @message.user_id = @user.id
  @message.receiver_id = @receiver.id
  @message.conversation_id = @message_getter.conversation_id
  @message.subject = params[:subject]
  @message.body = params[:body]
  @message.status = "unread"
  end
  if  @message.save
   @notification = Notification.new()
   @notification.first_source = "message"
   @notification.user_id = @receiver.id
   @notification.reviewer_id = @user.id
   @notification.notification_flag = "unread"
   @notification.save
  flash[:notice]="message was successfully sent to #{@receiver.user_name}"
  else
  flash[:notice]="An error Occurred"
  end
  
  redirect_to(:controller=>"profile",:action=>'profile',:id=>@receiver.id,:sort=>"send_message")
end

end
