class UsersController < ApplicationController

layout :resolve_layout
helper :partnership
helper :beep




def full_size
 @image=UserImage.find(params[:id])
 @user = User.find(@image.user_id)
end

def public_register
@user=User.new
@image=UserImage.new
  if request.post?
  @user=User.create(params[:user])
  @user.user_type='regular'
  @user.reputation = 'rukkie'
  @user.last_login=Time.now
  if @user.user_name==""
  flash[:notice] = "You must fill all the fields"
  else
  respond_to do |format|
  if @user.save
    @rank = Rank.new()
    @rank.user_id = @user.id
    @rank.user_point = 0
    @rank.rank_type = "Freshman"
    @profile = Profile.new
    @profile.user_id = @user.id
    @profile.save
    @rank.save
        session[:user_id] =@user.id
        flash[:notice] = "Welcome to your office."
        format.html{ redirect_to office_path(:id=>"activity")}
        format.js
  else
        format.html {render :action=>"public_register"}
        format.xml  {render :xml=> @user.errors,:status=>:unprocessable_entity}
  end
  end
  end
  end
end

def user_pic
 @picture = UserImage.find(:first,:conditions=>['user_id=?',session[:user_id]])
 @user=User.find(session[:user_id])
 if request.post?
      if @picture.blank?
      @picture = UserImage.new(params[:userimage])
      @user=User.find(session[:user_id])
      @picture.user_id = @user.id
      @picture.save

     else
     @picture.update_attributes(params[:userimage])
     if @picture.blank?
      @pictures=UserImage.new(params[:userimage])
      @pictures.user_id = @user.id
      @pictures.save
     end
    end
    respond_to do |format|
     format.html{ redirect_to(:controller=>'profile',:action=>'profile', :id=>@user.id,:sort=>'all')}

    end
  end

end

def update
end

def office
 @feed_array = []
 @feed_array2 = []
 @winning = []
 @losing = []
 @user = User.find(session[:user_id])
 @mark = params[:id]
 @search_params = params[:name]
 @user_items = @user.items
 @feed_loop = Feed.find(:all,:order=>["created_at desc"])

  for feed in @feed_loop
  unless feed.source == "item" || feed.source == "rank"
  @beep_loop=Beep.find(feed.beep_id)
  @feed_type1 = Partnership.find_by_user_id_and_partner_id_and_status(@user.id,@beep_loop.quoted_user,"accepted")
  @feed_type3 = Partnership.find_by_user_id_and_partner_id_and_status(@user.id,@beep_loop.beeped_at,"accepted")
  if @beep_loop.user_id == @user.id
  @beep_user_check  = "yes"
  end

  end
  @feed_type2 = Partnership.find_by_user_id_and_partner_id_and_status(@user.id, feed.user_id,"accepted")

  if feed.user_id == @user.id || feed.third_source == "public" || @feed_type1 != nil || @feed_type3 != nil || @feed_type2 != nil ||  @beep_user_check == "yes"
   @beep_user_check = "no"
   @feed_array << feed
  end

  end
    
 

  @feed = Kaminari.paginate_array(@feed_array).page(params[:page]).per(10)





 @beep_store = @user.beeps
 @partner_count = Partnership.where("user_id=? and status=?",@user.id,"accepted")
 if @mark == "utility"
 @beep_comments = Beep.find(params[:mark])
 end

 if request.post?
   
 if @mark == "activity"
   @Beep = Beep.new()
   @feed= Feed.new()
   @Beep.beep_content= params[:beep_text]
   @Beep.scope=params[:name]
   @Beep.user_id = @user.id
   @update = "yes"
   if @Beep.beep_content == ""
   flash[:alert]="Enter Beep Content"
   flash[:notice]="Enter Beep Content"
   else
   @Beep.save
   @feed.source_id = @Beep.id
   @feed.source = "beep"
   @feed.user_id = @user.id
   @feed.beep_id =@Beep.id
   @feed.third_source = @Beep.scope
   @feed.save
   end
   @feed_loop2 = Feed.find(:all,:order=>["created_at desc"])

  for feeds in @feed_loop2
  unless feeds.source == "item" || feeds.source == "rank"
  @beep_loop=Beep.find(feeds.beep_id)
  @feed_type1 = Partnership.find_by_user_id_and_partner_id_and_status(@user.id,@beep_loop.quoted_user,"accepted")
  @feed_type3 = Partnership.find_by_user_id_and_partner_id_and_status(@user.id,@beep_loop.beeped_at,"accepted")
  if @beep_loop.user_id == @user.id
  @beep_user_check  = "yes"
  end

  end
  @feed_type2 = Partnership.find_by_user_id_and_partner_id_and_status(@user.id, feeds.user_id,"accepted")

  if feeds.user_id == @user.id || feeds.third_source == "public" || @feed_type1 != nil || @feed_type3 != nil || @feed_type2 != nil ||  @beep_user_check == "yes"
   @beep_user_check = "no"
   @feed_array2 << feeds
  end
  
  end
 @feed = Kaminari.paginate_array(@feed_array2).page(params[:page]).per(10)

 else
 if @mark == "partner"
    @result = User.where("user_name LIKE ? or first_name LIKE  ? or last_name LIKE ?", params[:name], params[:name], params[:name])
 else
 end
 end
 respond_to do |format|
  format.html{ redirect_to(:action=>'office', :id=>params[:id])}
  format.js
 end
end

end

def deactivate_account
 @user = User.find(params[:id])

  if request.post?
  if user = User.authenticate(@user.user_name, params[:password])
  unless params[:goodbye].blank?
   @last_word = LastWords.new
   @last_word.last_words = params[:goodbye]
   @last_word.save
  end
   
  @notification= Notification.find(:all,:conditions=>["reviewer_id=?",@user.id])
  @conversation= Conversation.find(:all,:conditions=>["receiver_id=?",@user.id])
  @partner =  Partnership.find(:all,:conditions=>["partner_id=?",@user.id])
  @compete = @user.competes
  @beep = Beep.all
  @entities = @notification + @conversation +  @partner
  for entity in @entities
     entity.destroy
  end
  for compete in @compete
  @beep = compete.beep
  @beep.destroy
  end
  session[:user_id] = nil
  user.destroy
  respond_to do |format|
  format.html { redirect_to root_path }
  end
  else
  @error = "error"
  end
  end
  
  end


def edit_info
 @user = User.find(params[:id])

 if request.post?
 respond_to do |format|
 if @user.update_attributes(params[:user])
        flash[:notice] = "Your user entry was succesfully edited"
        format.html { redirect_to(:controller=>'profile',:action=>'profile',:id=>@user.id ,:sort=>'all') }
        format.xml  { head :ok }
 else
        format.html { render :action => "edit_info" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
 end
 end
 end
end



def utility
 @winning = []
 @losing = []
 @beep = Beep.find(params[:id])
 @user = User.find(session[:user_id])
 @beep_comment = BeepComment.find(:all, :conditions=>["beep_id=?",@beep.id],:order=>"created_at desc")

 if request.post?

 @beep_comment_new= BeepComment.new()
 @beep_comment_new.beep_id = @beep.id
 @beep_comment_new.user_id = @user.id
 @beep_comment_new.beep_content = params[:content]
 unless params[:content].blank?
 @beep_comment_new.save
 end
  respond_to do |format|
  format.html{ redirect_to(:action=>'utility', :id=>@beep.id)}
  format.js
 end
 end

end



def partner

end

def user_info
 @user = User.find(params[:id])
 unless session[:user_id].blank?
 @current_user = User.find(session[:user_id])
 end
 @winning = []
 @losing = []
 @user_items = @user.items
 @requested=params[:requested]
 @beep_store = @user.beeps
 @partner_count = Partnership.where("user_id=? and status=?",@user.id,"accepted")
 if @requested=="create_partnership"
 Partnership.request(@current_user.id,@user.id)
 @indicator = 'request_sent'
 respond_to do |format|
  format.html{ redirect_to :controller=>'users',:action=>'profile',:id=>"activity"}
  format.js
 end
end
end




private
  def resolve_layout
    case action_name
    when 'user_pic','user_info','full_size'
      nil
    else
      'application'
    end
  end

end
