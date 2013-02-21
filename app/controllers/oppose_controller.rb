class OpposeController < ApplicationController
layout :resolve_layout
def view
@beep = Beep.find(params[:id])
@user = User.find(session[:user_id])
@beep_all =Oppose.find(:all,:order=>" created_at DESC",:conditions=>["beep_id=?",@beep.id],:limit=>2)
@all_beep_oppose= Support.find(:all,:order=>" created_at DESC",:conditions=>["beep_id=?",@beep.id])
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
@feed=  Feed.new()
@notification = Notification.new()
@oppose = Oppose.new()
@oppose.content = params[:content]
@oppose.user_id = @user.id
@oppose.beep_id =@beep.id
@oppose.hide = params[:hide]
unless @oppose.content.blank?
@oppose.save
@notification.first_source = 'oppose'

@notification.user_id = @beep.user_id
@notification.reviewer_id = @user.id
@notification.first_source_id =@oppose.id
@notification.notification_flag = "unread"
@notification.first_source_id =@oppose.id
@notification.beep_id = @beep.id
@notification.hidden_flag = @oppose.hide
@notification.beep_id=@beep.id
@notification.save
@feed.source_id = @beep.id

@feed.second_source_id = @oppose.id

@feed.second_source ="oppose"
@feed.third_source = @beep.scope
@feed.fought_source = @oppose.hide
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




