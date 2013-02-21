class BeepCommentController < ApplicationController
layout :resolve_layout
  def create_comment
   @requested=params[:requested]
   @user=User.find(session[:user_id])
   @beep = Beep.find(params[:id])
   @beep_comment = BeepComment.find(:all, :conditions=>["beep_id=?",@beep.id],:limit=>2)
   @partner_count = Partnership.where("user_id=? and status=?",@user.id,"accepted")
   if request.post?
   @feed= Feed.new()
   @beep_comment_new= BeepComment.new()
   @beep_comment_new.beep_id = @beep.id
   @beep_comment_new.user_id = @user.id
   @beep_comment_new.beep_content = params[:content]
   unless params[:content].blank?
   if @beep_comment_new.save
   @due_feed = Feed.find(:all,:conditions=>["source=? && beep_id=?","sub_beep",@beep.id])
   for feed in @due_feed
   feed.destroy
   end
   @feed.second_source_id = @beep_comment_new.id
   @feed.second_source ="comment"
   @feed.third_source = @beep.scope
   @feed.beep_id = @beep.id
   @feed.source = "sub_beep"
   @feed.user_id = @user.id
   @feed.save
   @notification = Notification.new()
   @notification.first_source = "comment"
   @notification.user_id = @beep.user_id
   @notification.reviewer_id = @user.id
   @notification.beep_id = @beep.id
   @notification.first_source_id = @beep_comment_new.id
   @notification.notification_flag = "unread"
   @notification.save
   end
   end
   @beep_comment = BeepComment.find(:all, :conditions=>["beep_id=?",@beep.id],:order=>"created_at desc",:limit=>4)
   respond_to do |format|
   format.html{ redirect_to :controller=>'profile',:action=>'profile',:id=>@user.id ,:sort=>"all"}
   format.js
   end
   end
    end

private
  def resolve_layout
    case action_name
    when 'create_comment'
      nil
    else
      'application'
    end
  end

end




