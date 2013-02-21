class JoinController < ApplicationController
layout :resolve_layout
 helper :join
 def create_join
   @current_user=User.find(session[:user_id])
   @compete = Compete.find(params[:compete])
   @beep = Beep.find(params[:id])
   if request.post?
   @join = Join.new()
   @feed = Feed.new()
   @join.beep_id = @beep.id
   @join.user_id = @current_user.id
   @join.hide = params[:hide]
   if @join.save
   @rank_checker = Rank.find(:first,:conditions=>["user_id=?",@beep.user.id])
   @current_rank = @rank_checker.rank_type
   @current_point = @rank_checker.user_point
   @new_point  = @current_point + 1
  if  @new_point > 0 || @new_point < 151
  @rank_type = "Freshman"
  else
  if  @new_point > 150 ||  @new_point < 301
  @rank_type = "Blogger"
  else
  if  @new_point > 300 ||  @new_point < 451
  @rank_type = "Middle class"
  else
  if  @new_point > 450 ||  @new_point < 601
  @rank_type = "Upper class"
  else
  if @new_point > 600
  @rank_type = "Royalty"
  end
  end
  end
  end
  end
  unless @current_rank == @rank_type
  @feed = Feed.new()
  if @new_point > @current_point
   @feed.source = "rank"
   @feed.second_source = "up"
   @feed.user_id = @beep.user.id
   @feed.third_source = "partner"
   @feed.save

  else
   @feed.source = "rank"
   @feed.second_source = "down"
   @feed.user_id = @beep.user.id
   @feed.third_source = "partner"
   @feed.save
 end

end
@rank = Rank.new()
@rank.user_id = @beep.user.id
@rank.user_point = @new_point
@rank.rank_type = @rank_type
@rank.save
@rank_checker.destroy


   @flag="yes"
   @feed.second_source_id = @join.id
   @feed.second_source ="join"
   @feed.third_source = @beep.scope
   @feed.beep_id = @beep.id
   @feed.source = "join"
   @feed.fought_source = @join.hide
   @feed.compete_id = @compete.id
   @feed.user_id = @current_user.id
   @feed.save
   @notification = Notification.new()
   @notification.first_source = "join"
   @notification.user_id = @beep.user_id
   @notification.reviewer_id = @current_user.id
   @notification.notification_flag = "unread"
   @notification.beep_id = @beep.id
   @notification.save
   end
   respond_to do |format|
   format.html{ redirect_to :controller=>'compete',:action=>'compete_room',:id=>@compete.id}
   
   format.js
   end
   end
 end

 

private
  def resolve_layout
    case action_name
    when 'create_join'
      nil
    else
      'application'
    end
  end

 
end
