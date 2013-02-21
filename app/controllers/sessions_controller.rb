class SessionsController < ApplicationController
def create
if user = User.authenticate(params[:username], params[:password])
session[:user_id] = user.id
@rank_checker = Rank.find(:first,:conditions=>["user_id=?",user.id])
if @rank_checker.blank?
@rank = Rank.new()
@rank.user_id = user.id
@rank.user_point = 0
@rank.rank_type = "Freshman"
@rank.save
end

flash[:notice] = "Hello #{user.user_name}, Welcome to the LegoAds office."
redirect_to office_path(:id=>"activity")
else
flash[:notice] = "Invalid login/password combination"
redirect_to root_path
 
end
end

  def destroy
    reset_session
    redirect_to root_path
  end
end
