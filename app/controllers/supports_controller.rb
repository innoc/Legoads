class SupportsController < ApplicationController
layout :resolve_layout
def view
@beep = Beep.find(params[:id])
@requested=params[:requested]
@user = User.find(session[:user_id])
@beep_support= Support.find(:all,:order=>" created_at DESC",:conditions=>["beep_id=?",@beep.id],:limit=>2)
@all_beep_support= Support.find(:all,:order=>" created_at DESC",:conditions=>["beep_id=?",@beep.id])
@partner_count = Partnership.where("user_id=? and status=?",@user.id,"accepted")
if @requested=="create_partnership"
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
@feed= Feed.new()
@notification = Notification.new()
@support = Support.new()
@support.content = params[:content]
@support.user_id = @user.id
@support.beep_id =@beep.id
@support.hide = params[:hide]
unless @support.blank?
@support.save
@notification.first_source = 'support'
@notification.user_id = @beep.user_id 
@notification.reviewer_id = @user.id
@notification.first_source_id =@support.id
@notification.notification_flag = "unread"
@notification.first_source_id =@support.id
@notification.hidden_flag = @support.hide
@notification.beep_id=@beep.id
@notification.save
@feed.source_id = @beep.id
@feed.second_source_id = @support.id
@feed.second_source ="support"
@feed.third_source = @beep.scope
@feed.beep_id = @beep.id
@feed.fought_source = @support.hide
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


