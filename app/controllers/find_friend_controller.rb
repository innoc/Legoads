class FindFriendController < ApplicationController

layout :resolve_layout

def invite_friend
 @current_user = User.find(session[:user_id])
end

def find_friend
@name = params[:name]
@email = params[:email]
@current_user = User.find(session[:user_id])
@find_friend = FindFriend.new()
@find_friend.name = @name
@find_friend.email = @email
@find_friend.user_name = "#{@current_user.first_name} #{@current_user.last_name}"
if @find_friend.save && UserMailer.find_new_user(@find_friend).deliver
flash[:notice] = "Invitation has been sent for processing"
else
flash[:notice] = "An erorr occured,check the email you entered"
end
redirect_to :back

end

private


def resolve_layout
    case action_name
    when 'invite_friend'
      nil
    else
      'application'
    end
  end



end
