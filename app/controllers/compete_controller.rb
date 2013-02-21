# encoding: UTF-8

class CompeteController < ApplicationController
 layout :resolve_layout


def compete_info

end

def join_info

end

def delete
 @compete = Compete.find(params[:id])
 @beep = @compete.beep
 @beep.destroy
 @compete.destroy
 @user = User.find(session[:user_id])
 redirect_to(:controller=>"profile",:action=>"profile",:sort=>"contest",:id=>@user.id)
end

def compete_room
 @compete = Compete.find(params[:id])
 @original_beep = Beep.find(@compete.original_beep)
 @oposing_beep = @compete.beep
 @user = User.find(session[:user_id])
  if request.post?
    @comment = CommentCompete.new()
    @comment.content = params[:content]
    @comment.compete_id = @compete.id
    @comment.user_id = @user.id
    @comment.save
  respond_to do |format|
  format.html{ redirect_to(:action=>'compete_room', :id=>@compete.id)}
  format.js
  end
  end
  end


def create_competition
  @beep=Beep.find(params[:id])
  if request.post?
  @user = User.find(params[:oponent_id])
  @oponent = User.find(session[:user_id])
  @beep_compete = Beep.new()
  @compete = Compete.new()
  @feed = Feed.new()
  @notification = Notification.new()
  @compete.user_id = @user.id
  @compete.oponent_id = @oponent.id
  @compete.original_beep = @beep.id
  if @compete.save
   @beep_compete.compete_id = @compete.id
   @beep_compete.beep_content = params[:compete_text]
   @beep_compete.user_id = @oponent.id
   @beep_compete.scope = "partner"
  if @beep_compete.save
   @feed.source_id = @beep_compete.id
   @feed.compete_id = @compete.id
   @feed.source = "contest"
   @feed.user_id = @user.id
   @feed.beep_id= @beep.id
   @feed.third_source = @beep.scope
   @feed.save
   @notification.first_source = "contest"
   @notification.user_id = @user.id
   @notification.reviewer_id = @oponent.id
   @notification.compete_id = @compete.id
   @notification.notification_flag = "unread"
   @notification.beep_id=@beep.id
   @notification.save
  else
  flash[:notice] = "An Error Occured"
  end
  respond_to do |format|
  format.html{ redirect_to(:action=>'compete_room', :id=>@compete.id)}
  end

  end
  end



end


private
def resolve_layout
    case action_name
    when 'create_competition','compete_info','join_info'
      nil
    else
      'application'
    end
  end
end
