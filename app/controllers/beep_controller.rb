class BeepController < ApplicationController
layout :resolve_layout
helper :partnership
helper :beep
 def create
  @user = User.find(params[:id])
   if request.post?
   @user = User.find(params[:id])
   @Beep = Beep.new()
   @feed= Feed.new()
   @Beep.beep_content= params[:beep_text]
   @Beep.scope=params[:name]
   @Beep.user_id = @user.id
   if @Beep.beep_content == ""
   flash[:notice]="beep content was not entered"
   else
   @Beep.save
   @feed.source_id = @Beep.id
   @feed.source = "beep"
   @feed.user_id = @user.id
   @feed.beep_id= @Beep.id
   @feed.third_source = @Beep.scope
   @feed.save
   flash[:alert]="Beep created"
   flash[:notice]="Beep created"
   end
    redirect_to :controller=>'profile',:action=>'profile',:id=>@user.id,:sort=>"all"
   end
end






def beep_picture
 @user=User.find(session[:user_id])

 if request.post?
   @beep = Beep.new
   @beep.beep_content = "beep_picture_lego"
   @beep.user_id = @user.id
   @beep.scope = params[:name]
   @beep.save
   @beep_picture = BeepPicture.new(params[:beeppicture])
   @beep_picture.user_id = @user.id
   @beep_picture.beep_id = @beep.id
 
   if @beep_picture.save
   flash[:notice]="Beep created"
     @feed=Feed.new
     @feed.source_id = @beep_picture.id
     @feed.user_id = @user.id
     @feed.beep_id = @beep.id
     @feed.source = "beep_picture"
     @feed.third_source = @beep.scope
     @feed.save
   else
    @beep.delete

    flash[:notice]="Error:::You forgot to upload an image or the file you uploaded is not an image file "
   end
     redirect_to :back
   end

 end


def full_size
 @image=BeepPicture.find(params[:id])
end












  def beep_at
   @user = User.find(params[:id])
   @current_user = User.find(session[:user_id])
   if request.post?
   @user = User.find(params[:id])
   @Beep = Beep.new()
   @feed= Feed.new()
   @BeepAt = BeepAt.new()
   @notification = Notification.new()
   @profile_feed = ProfileFeed.new()
   @Beep.beep_content= params[:beep_text]
   @Beep.scope="partner"
   @Beep.user_id =@current_user.id
   @Beep.beeped_at =  @user.id

   if @Beep.beep_content == ""
   flash[:notice]="Error::Beep content was not entered"
   else
   @Beep.save
   @BeepAt.user_id = @user.id
   @BeepAt.beep_id = @Beep.id
   @BeepAt.save
   @feed.source_id = @Beep.id
   @feed.source = "beep"
   @feed.user_id = @current_user.id
   @feed.beep_id= @Beep.id
   @feed.third_source = @Beep.scope
   @notification.first_source = "beep_at"
   @notification.user_id = @user.id 
   @notification.reviewer_id = @current_user.id
   @notification.notification_flag = "unread"
   @notification.beep_id=@Beep.id
   @notification.save
   @feed.save
   flash[:alert]="Beep created"
   flash[:notice]="Beep created"
   end
    redirect_to :controller=>'profile',:action=>'profile',:id=>@user.id,:sort=>"all"
   end
end























 def quote_beep
   @user = User.find(session[:user_id])
   @quoted_beep = Beep.find(params[:id])
   @quoted_user = User.find(@quoted_beep.user_id)
   if request.post?
   @Beep = Beep.new()
   @feed= Feed.new()
   @profile_feed = ProfileFeed.new()
   @Beep.beep_content=@quoted_beep.beep_content
   @Beep.scope=@quoted_beep.scope
   @Beep.user_id = @user.id
   @Beep.quoted_beep = @quoted_beep.id
   @Beep.quote_flag = "quote"
   if @quoted_beep.quoted_user.blank?
   @Beep.quoted_user = @quoted_user.id
   else
   @Beep.quoted_user = @quoted_beep.quoted_user
   end 
   if @Beep.beep_content == ""
   flash[:alert]="Enter Beep Content"
   flash[:notice]="Enter Beep Content"
   else
   
   @Beep.save
   @feed.source_id = @Beep.id
   @feed.source = "beep"
   @feed.user_id = @user.id
   @feed.beep_id= @Beep.id
   @feed.third_source = @Beep.scope
   @feed.save

   flash[:alert]="Beep Quoted"
   flash[:notice]="Beep Quoted"
   end
    redirect_to :controller=>'users',:action=>'office',:id=>"activity"
   end
 end


  def quote_beep_partner_profile
   @user = User.find(session[:user_id])
   @user_partner = User.find(params[:user_id])
   @quoted_beep = Beep.find(params[:id])
   @quoted_user = User.find(@quoted_beep.user_id)
   if request.post?
   @Beep = Beep.new()
   @feed= Feed.new()
   @Beep.beep_content=@quoted_beep.beep_content
   @Beep.scope=@quoted_beep.scope
   @Beep.user_id = @user.id
   @Beep.quoted_beep = @quoted_beep.id
   @Beep.quote_flag = "quote"
   if @quoted_beep.quoted_user.blank?
   @Beep.quoted_user = @quoted_user.id
   else
   @Beep.quoted_user = @quoted_beep.quoted_user
   end
   if @Beep.beep_content == ""
   flash[:alert]="Error::Enter Beep Content"
   flash[:notice]="Error::Enter Beep Content"
   else

   @Beep.save
   @feed.source_id = @Beep.id
   @feed.source = "beep"
   @feed.user_id = @user.id
   @feed.beep_id= @Beep.id
   @feed.third_source = @Beep.scope
   @feed.save
   flash[:alert]="Beep Quoted"
   flash[:notice]="Beep Quoted"
   end
    redirect_to :controller=>"profile",:action=>"profile",:id=>@user_partner.id,:sort=>"all"
   end
 end
 def quote_beep_profile
   @user = User.find(session[:user_id])
   @quoted_beep = Beep.find(params[:id])
   @quoted_user = User.find(@quoted_beep.user_id)
   if request.post?
   @Beep = Beep.new()
   @feed= Feed.new()
   @profile_feed = ProfileFeed.new()
   @Beep.beep_content=@quoted_beep.beep_content
   @Beep.scope=@quoted_beep.scope
   @Beep.user_id = @user.id
   @Beep.quoted_beep = @quoted_beep.id
   @Beep.quote_flag = "quote"
   if @quoted_beep.quoted_user.blank?
   @Beep.quoted_user = @quoted_user.id
   else
   @Beep.quoted_user = @quoted_beep.quoted_user
   end 
   if @Beep.beep_content == ""
   flash[:alert]="Error::Enter Beep Content"
   flash[:notice]="Error::Enter Beep Content"
   else
   
   @Beep.save
   @feed.source_id = @Beep.id
   @feed.source = "beep"
   @feed.user_id = @user.id
   @feed.beep_id= @Beep.id
   @feed.third_source = @Beep.scope
   @feed.save
   flash[:alert]="Beep Quoted"
   flash[:notice]="Beep Quoted"
   end
    redirect_to :controller=>"profile",:action=>"profile",:id=>@user.id,:sort=>"all"
   end
 end

 def hottest_beep_view
 @winning = []
 @losing = []
 @user = User.find(session[:user_id])
 @beep=Beep.find(params[:id])
 @beep_store = @user.beeps
 end

def hottest_beeps
 @Beep= Beep.find(:all,:order=>'created_at desc',:limit=>100)
 respond_to do |format|
  format.html{ redirect_to(:action=>'profile', :id=>"mark")}
  format.js
 end
end

def delete
  @beep=Beep.find(params[:id])
  @user = User.find(params[:user_id])
  @beep_compete_checker = Compete.find(:first,:conditions=>["original_beep=?",@beep.id])
  unless  @beep_compete_checker.blank?
  @beep_compete_checker.destroy
  @beep_compete_checker.beep.destroy
  end
  @beep.destroy 
  redirect_to :controller=>'profile',:action=>'profile',:id=>@user.id,:sort=>"all"
end

private
  def resolve_layout
    case action_name
    when 'quote_beep','create','quote_beep_profile','quote_beep_partner_profile','beep_picture','full_size'
      nil
    else
      'application'
    end
  end

end
