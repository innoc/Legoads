class AdminsController < ApplicationController

def index
@user = User.find(:all)
@item =Item.find(:all)
end

def keep_tabs
@tabs=TabsEntry.find(:all)
if request.post?
  @Tab=TabsEntry.find(params[:id])
  Email.keep_tabs_email(@Tab).deliver
  @Tab.update_attribute("check",0)
  respond_to do |format|
        format.html{ redirect_to(:controller=>'admins',:action=>'keep_tabs',:id=>1)}
        format.js 
   end
end
end

def admin_user_list
@user = User.find(:all)
end

def activated_user
  @user=User.find(:all,:conditions=>["account=? and user_type=?",'Activate','Business'])
end

def deactivated_user
  @user=User.find(:all,:conditions=>["account=? and user_type=?",'Deactivate','Business'])
end

def user_info
@user = User.find(params[:id])
@item = Item.find(:all , :conditions => ["user_id = ?",@user] )
@itemCount = @item.count
end

def search
	 @user = User.search(params[:user_name])
end

def item_search
  @item = Item.search(params[:item_name])
end


def items_list
@item=Item.find(:all)
end

def item_info
  @item=Item.find(params[:id])
end

def show_image
@image=Picture.find(params[:id])
@item=Item.find(@image.item_id)
end

def requests
@requests =Request.find(:all,:order=>'id DESC')
end

def request_search
  @requests = Request.search(params[:requester_name])
end

end
