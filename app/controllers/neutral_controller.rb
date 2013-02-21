class NeutralController < ApplicationController
layout :resolve_layout
def view
@beep = Beep.find(params[:id])
@user = User.find(session[:user_id])
@beep_all = Neutral.find(:all,:order=>" created_at DESC",:conditions=>["beep_id=?",@beep.id])
@partner_count = Partnership.where("user_id=? and status=?",@user.id,"accepted")
if @requested=="create_partnership"
 @user = User.find(session[:user_id])
 @partner = User.find(params[:partner])
 Partnership.request(@user.id,@partner.id)
 @indicator = 'request_sent'
 respond_to do |format|
  format.html{ redirect_to :controller=>'users',:action=>'profile',:id=>"activity"}
  format.js
 end
end
end

def create
@user = User.find(session[:user_id])
@beep = Beep.find(params[:id])
@notification = Notification.new()
@feed= Feed.new()
@neutral = Neutral.new()
@neutral.content = params[:content]
@neutral.user_id = @user.id
@neutral.beep_id =@beep.id
unless @neutral.content.blank?
@neutral.save
@notification.first_source = 'neutral'
@notification.user_id = @beep.user_id
@notification.reviewer_id = @user.id
@notification.first_source_id =@neutral.id

@notification.beep_id=@beep.id
@notification.notification_flag = "unread"
@notification.save
@feed.source_id = @beep.id
@feed.second_source_id = @neutral.id
@feed.second_source ="neutral"
@feed.third_source = @beep.scope
@feed.beep_id = @beep.id
@feed.source = "sub_beep"
@feed.user_id = @user.id
@feed.save
end
redirect_to :action=>'view',:id=>@beep.id
end





private
def resolve_layout
    case action_name
    when 'view'
      nil
    else
      'application'
    end
  end






end
