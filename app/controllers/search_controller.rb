class SearchController < ApplicationController
 def search_for
   @result = User.where("user_name LIKE ? or first_name LIKE  ? or last_name LIKE ?", "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%")
end


def list
  @user = User.find(:all,:conditions=>["user_name LIKE ? or first_name LIKE ? or last_name LIKE ?", "%#{params[:term]}%" , "%#{params[:term]}%" , "%#{params[:term]}%"],:limit=>10)
  @user_hash = []
  @user.each do |b|
   unless b.user_type == "admin"
    @image = b.user_image
    if @image.blank?
    @user_hash << {
      :id => b.id,
      :user_name => b.user_name,
      :image => "../../assets/photo.png",
      :first_name => b.first_name,
      :last_name => b.last_name
    }
    else

     @user_hash << {
      :id => b.id,
      :user_name => b.user_name,
      :image => b.user_image.image.url(:small),
      :first_name => b.first_name,
      :last_name => b.last_name
    }

    end
   end
   end

   render :json =>@user_hash

end

end
