class DislikeController < ApplicationController
 layout :resolve_layout
  helper :dislike
 def create_dislike
   @current_user=User.find(session[:user_id])
   @beep = Beep.find(params[:id])
   if request.post?
   @dislike= Dislike.new()
   @dislike.beep_id = @beep.id
   @dislike.user_id = @current_user.id
   @dislike.save
   @rank_checker = Rank.find(:first,:conditions=>["user_id=?",@beep.user.id])
   @current_rank = @rank_checker.rank_type
   @current_point = @rank_checker.user_point
   @new_point  = @current_point - 1
  if  @new_point > 0 and @new_point < 151
  @rank_type = "Freshman"
  else
  if  @new_point > 150 and  @new_point < 301
  @rank_type = "Blogger"
  else
  if  @new_point > 300 and  @new_point < 451
  @rank_type = "Middle class"
  else
  if  @new_point > 450 and  @new_point < 601
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
   @feed.source = "rank"
   @feed.second_source = "down"
   @feed.user_id = @beep.user.id
   @feed.third_source = "partner"
   @feed.save
  end
@rank = Rank.new()
@rank.user_id = @beep.user.id
@rank.user_point = @new_point
@rank.rank_type = @rank_type
@rank.save
@rank_checker.destroy
   respond_to do |format|
   format.html{ redirect_to :controller=>'users',:action=>'profile',:id=>"activity"}
   format.js
   end
   end
 end


 





private
  def resolve_layout
    case action_name
    when 'create_dislike'
      nil
    else
      'application'
    end
  end

end
