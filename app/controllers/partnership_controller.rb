class PartnershipController < ApplicationController
helper :partnership

def create
@user = User.find(session[:user_id])
@partner = User.find(params[:id])
unless Partnership.exists?(@user,@partner) == "yes_boss"
Partnership.request(@user.id,@partner.id)
@notification = Notification.new()
@notification.first_source = 'partner'
@notification.user_id = @partner.id
@notification.reviewer_id = @user.id 
@notification.notification_flag = "unread"
@notification.save
flash[:notice] = "Partnership request has been sent to #{@partner.user_name}"
else
flash[:notice] = "Partnership request has already been sent to #{@partner.user_name}"
end
 respond_to do |format|
  format.html{ redirect_to :controller=>'users',:action=>'office',:id=>"activity"}
  format.js
 end
end





def partner_page
  @user = User.find(session[:user_id])
end

def delete_request
@user = User.find(session[:user_id])
@partner = User.find(params[:id])
if Partnership.breakup(@user,@partner)
flash[:notice] = "Partnership request to #{@partner.user_name}  has been droped!"
redirect_to :controller=>'users',:action=>'office',:id=>"partner_page"
end
end

def decline_request
@user = User.find(session[:user_id])
@partner = User.find(params[:id])
if Partnership.breakup(@user,@partner)
flash[:notice] = "Partnership request from #{@partner.user_name}  has been declined!"
redirect_to :controller=>'users',:action=>'office',:id=>"partner_page"
end
end

def delete_partner
@user = User.find(session[:user_id])
@partner = User.find(params[:id])
if Partnership.breakup(@user,@partner)
flash[:notice] = "Partnership request from #{@partner.user_name}  has been deleted!"
redirect_to :controller=>'users',:action=>'office',:id=>"partner_page"
end
end

def accept
@user = User.find(session[:user_id])
@partner = User.find(params[:id])
if @user.requested_partners.include?(@partner)
Partnership.accept(@user, @partner)
flash[:notice] = "Partnership with #{@partner.user_name} accepted!"
else
flash[:notice] = "No Partnership request from #{@partner.user_name}."
end
redirect_to :controller=>'users',:action=>'office',:id=>"partner_page"
end

private
def setup_friends
@user = User.find(session[:user_id])
@partner = User.find(params[:id])
end

end
