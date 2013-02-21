class ProfileController < ApplicationController
helper :partnership
helper :beep
layout :resolve_layout

def profile_front_image
 @profile=Profile.find(params[:profile_id])
 @profile_image=ProfileImage.find(:first,:conditions=>["profile_id=?",@profile.id])
 @user=User.find(session[:user_id])
 
 if request.post?
      if @profile_image.blank?
      @profile_image  = ProfileImage.new(params[:profileimage])
      @user=User.find(session[:user_id])
      @profile_image.profile_id = @profile.id
      unless @profile_image.save
      flash[:notice]="One of two errors occured......1) Your image file was less than 668x252px......2) You didn't upload an image at all"
      end
     else
      unless  @profile_image.update_attributes(params[:profileimage])
      flash[:notice]="One of two errors occured......1) Your image file was less than 668x252px.....2) You didn't upload an image at all"
      end
    end
    respond_to do |format|
      format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")}
    end
  end
end

def delete_front_image
  @user=User.find(session[:user_id])
  @profile=Profile.find(params[:profile_id])
  @profile_image=ProfileImage.find(:first,:conditions=>["profile_id=?",@profile.id])
  @profile_image.destroy
  redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")
end

def profile_background_color
 @profile=Profile.find(params[:profile_id])
 @user=User.find(session[:user_id])
 if request.post?
    if params[:color_code].blank?
     flash[:notice]="you must enter a color code"
    else
    @profile.update_attribute("bg_color",params[:color_code])
    end
    respond_to do |format|
     format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")}
    end
  end
end

def profile_font_color
 @profile=Profile.find(params[:profile_id])
 @user=User.find(session[:user_id])
 if request.post?
    if params[:color_code].blank?
     flash[:notice]="you must enter a color code"
    else
    @profile.update_attribute("font_color",params[:color_code])
    end
    respond_to do |format|
     format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")}
    end
  end
end

def profile_font_color_default
     @profile=Profile.find(params[:profile_id])
     @user=User.find(session[:user_id])
     @profile.update_attribute("font_color","null")
  
    respond_to do |format|
     format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")}
    end
 
end

def profile_background_color_default
    @profile=Profile.find(params[:profile_id])
    @user=User.find(session[:user_id])
    @profile.update_attribute("bg_color","null")

    respond_to do |format|
     format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")}
    end
end

def content_holder_default
    @profile=Profile.find(params[:profile_id])
    @user=User.find(session[:user_id])
    @profile.update_attribute("content_holder","null")
    respond_to do |format|
     format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")}
    end
end

def content_holder_color
 @profile=Profile.find(params[:profile_id])
 @user=User.find(session[:user_id])
 if request.post?
    if params[:color_code].blank?
     flash[:notice]="you must enter a color code"
    else
    @profile.update_attribute("content_holder",params[:color_code])
    end
    respond_to do |format|
     format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>"all")}
    end
  end
end





def  profile
 @user = User.find(params[:id])
 @current_user = User.find(session[:user_id])
 @profile_id=@user.profile.id
 @profile_visitor=User.find(session[:user_id])
 @winning = []
 @losing = []
 @partner_count= @user.partners
 @mark = params[:sort]
 @user_items = @user.items
 #@feed = ProfileFeed.find(:all,:conditions=>["user_id=?", @user.id],:order=>"created_at desc")
 #@beep_store_paginated = Beep.order('created_at desc').page(params[:page])
 @beep_stores = Beep.all(:conditions=>["user_id=? or beeped_at=?",@user.id,@user.id],:order=>"created_at desc")
 @beep_status = @user.beeps
 @beep_store  = Kaminari.paginate_array(@beep_stores).page(params[:page]).per(10)


 if @mark == "all"
   @name = "Beeps"
 end
  if @mark == "picture_gallary"
   @name = "Beeped images"
 end
 if @mark == "winning"
   @winning_beep = []
   @name = "Winning Beeps"
 end
  if @mark == "losing"
   @losing_beep = []
   @name = "Losing Beeps"
 end
 if @mark == "quote"
   @quoted_beep = []
   @name = "Quoted Beeps"
   @quoted_user = Beep.find(:all,:conditions=>["quoted_user=?",@user.id],:order=>"created_at desc")
 end
 if @mark == "partners"
    @quoted_beep = []
    @name = "Partner list"
    @partners= @user.partners
 end
 if @mark == "send_message"
   @name = "Send private message"
 end
  if @mark == "check_message"
   @name = "messages"
   @conversation = Conversation.find(:all,:conditions=>["user_id=? or receiver_id=?",@user.id,@user.id])
  end
   if @mark == "contest"
   @name = "Contest"
   @contest_finder1 = Compete.find(:all,:conditions=>["user_id=?",@user.id],:order=>"created_at desc")
   @contest_finder2 = Beep.find(:all,:conditions=>["user_id=? and compete_id >?",@user.id,0])
   @contest = @contest_finder1 + @contest_finder2
  end
 if request.post?
 
respond_to do |format|
  format.html{ redirect_to(:action=>'profile', :id=>@user.id,:sort=>@mark)}
  format.js
 end
 
 end
end

private
  def resolve_layout
    case action_name
    when 'profile_front_image','profile_background_color','profile_font_color','content_holder_color'
      nil
    else
      'application'
    end
  end


end
