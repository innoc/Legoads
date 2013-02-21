class ItemsController < ApplicationController
layout :resolve_layout

require 'json'

def new
    @item = Item.new
    @user= User.find(session[:user_id])
    3.times{@item.pictures.build}
    respond_to do |format|
      format.html
      format.xml  { render :xml => @item }
    end
 end



def purchase_item
  @suggested_items=[]
  @item=Item.find(params[:id])
  @item_cart=Item.find(params[:id])
  @cart = find_cart
unless @item.blank?
@category=@item.category_type
@items = Item.find(:all,:conditions=>["item_status=? && category_type=?",'FREE',@category])
for item in @items
if item.category == @item.category
else
@suggested_items << item
end
end
end
end

def index
 @winning = []
 @losing = []
 
end


def edit
 @item = Item.find(params[:id])
end

def view_user_item
@user = User.find(params[:id])
@current_user = User.find(params[:id])
@profile_visitor=User.find(session[:user_id])
@item = Item.find(:all,:conditions=>["user_id=?",params[:id]])
end

 def update
    @item = Item.find(params[:id])
    
     respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = "Your item entry was succesfully edited"
        format.html { redirect_to(:action=>'manage_item',:id=>'1',:flag=>'all') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
  end
  end

 def delete
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html {redirect_to(:action=>'manage_item',:id=>1)}
      format.xml  { head :ok }
    end
  end
 

  def create
    @user = User.find(session[:user_id])
    @item = Item.create(params[:item])
    @item.user_id = @user.id
    @item.item_status='FREE'
     if @item.save
     @feed=Feed.new()
     @feed.source_id = @item.id
     @feed.user_id = @user.id
     @feed.item_id = @item.id
     @feed.source = "item"
     @feed.save

           flash[:notice] = "Item Entry has been created and sent to the manage item section"
           redirect_to(:controller=>'users',:action=>'office', :id=>'activity')
       
      else
        render :action => "new" 
        
      end
     
  end


 def edit_image
 @item = Item.find(params[:id])
 @user= User.find(session[:user_id])

 if request.post?
  
    @picture = Picture.find(params[:flag])
    if @picture.update_attributes(params[:picture])
      flash[:notice]="Your item's image has been changed"
       respond_to do |format|
        format.html{ redirect_to(:controller=>'items',:action=>'edit_image', :id=>@item.id)}
        format.js
       end
    end

 end
 end 









 
def send_email
@item=Item.find(params[:id])
if request.post?
    @message=MessageTemplate.new
    @message.send_time = Time.now
    @message.email = params[:email]
    @message.item_name = @item.item_name
    if @message.save
    Email.registration_confirmation(@message).deliver
    respond_to do |format|
        format.html{ redirect_to(:controller=>'items',:action=>'item_list',:id=>@item.category)}
        format.js
    end
  else
    flash[:notice]="There was a problem with the email, please check the email and try again"
    redirect_to :controller=>'items',:action=>'item_list',:id=>@item.category
  end
  end
end

def seller_items
@suggested_items=[]
@user = User.find(params[:id])
@item = Item.paginate(:page=>params[:page],:per_page=>10,:conditions => ["user_id=?",@user.id])

unless @item.blank?
@category=@item[0].category_type
@items = Item.find(:all,:conditions=>["item_status=? && category_type=?",'FREE',@category])
for item in @items
if item.category == @item[0].category

else
@suggested_items << item
end
end
end
end

def manage_item
@user = User.find(session[:user_id])
@partner_count = Partnership.where("user_id=? and status=?",@user.id,"accepted")

@type = params[:type]

if @type=="new"
 @item = Item.find(:all,:conditions =>["item_condition=?","new"])
 @item_count = @item.count
 
else



if @type=="used"
  @item = Item.find(:all,:conditions =>["item_condition=? && user_id=?","used",@user.id])
  @item_count = @item.count

else

if @type=="not working"
  @item = Item.find(:all,:conditions =>["item_condition=? && user_id=?","Not working",@user.id])
  @item_count = @item.count
else
if @type=="almost new"
 @item = Item.find(:all,:conditions =>["item_condition=? && user_id=?","Almost new",@user.id])
 @item_count = @item.count
else
if @type == "searching"
    @result = Item.where("item_name LIKE ? && user_id=?","%#{params[:name]}%",@user.id)
    @item_count = @result.count
else
  @type="all"
  @item = @user.items
  @item_count = @item.count
end
end
end
end
end

if request.post?
respond_to do |format|
      format.html
      format.js
end
end

end


def full_size
 @image=Picture.find(params[:id])
 @item = Item.find(@image.item_id)


end

def see_all_comments
 @item = Item.find(params[:id])
 @item_comment = Comment.find(:all, :conditions=>["item_id=?",@item.id],:order=>"created_at desc")

end

def interested
 @item = Item.find(params[:id])
 @item_comment = Comment.find(:all, :conditions=>["item_id=?",@item.id],:order=>"created_at desc",:limit=>7)

 @user = User.find(@item.user_id)
 unless session[:user_id].blank?
 @current_user = User.find(session[:user_id])
 end

 
end

def market
@mark = params[:partial]

if @mark == "item_search"
@item = Item.find(:all,:conditions => ["item_status=? && category=?",'FREE',params[:id]])
end

if request.post?
if @mark == "search_for"
@item_search = Item.where("item_name LIKE ?","%#{params[:name]}%")
end
@name_it = params[:name]
respond_to do |format|
      format.html
      format.js
end
end

end


def show_item
 @item = Item.find(params[:id])
 @user= User.find(session[:user_id])
end



def empty
respond_to do |wants|
wants.html{redirect_to :action =>'index'}
wants.js{render}
end
session[:cart] = nil
#redirect_to :action => 'index'
end

def info
end
private


def resolve_layout
    case action_name
    when 'full_size'
      nil
    else
      'application'
    end
  end


end
