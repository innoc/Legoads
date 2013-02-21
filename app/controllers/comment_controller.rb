class CommentController < ApplicationController

 def create_comment
   @user=User.find(session[:user_id])
   @item = Item.find(params[:id])
   @item_comment = Comment.find(:all, :conditions=>["item_id=?",@item.id],:limit=>4)
   if request.post?
   @item_comment_new= Comment.new()
   @item_comment_new.item_id = @item.id
   @item_comment_new.commenter_id = @user.id
   @item_comment_new.comment_text = params[:content]
   @item_comment_new.save
   unless params[:content].blank?

   end
   @item_comment =Comment.find(:all, :conditions=>["item_id=?",@item.id],:order=>"created_at desc",:limit=>4)
   respond_to do |format|
   format.html{ redirect_to :controller=>'profile',:action=>'profile',:id=>@user.id ,:sort=>"all"}
   format.js
   end
   end
  end

  def create_comment_see_all
   @user=User.find(session[:user_id])
   @item = Item.find(params[:id])
   @item_comment = Comment.find(:all, :conditions=>["item_id=?",@item.id])
   if request.post?
   @item_comment_new= Comment.new()
   @item_comment_new.item_id = @item.id
   @item_comment_new.commenter_id = @user.id
   @item_comment_new.comment_text = params[:content]
   @item_comment_new.save
   unless params[:content].blank?

   end
   @item_comment =Comment.find(:all, :conditions=>["item_id=?",@item.id],:order=>"created_at desc")
   respond_to do |format|
   format.html{ redirect_to :controller=>'profile',:action=>'profile',:id=>@user.id ,:sort=>"all"}
   format.js
   end
   end
  end


end
