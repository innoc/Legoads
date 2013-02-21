class BeepPicture < ActiveRecord::Base
  # attr_accessible :title, :body
belongs_to :user
belongs_to :beep
attr_accessible :image
attr_accessible :description
has_attached_file :image,:path =>"C:/Users/mummy/LagoAds/public/:class/:attachment/:id/:style_:basename.:extension",:url=>"/:class/:attachment/:id/:style_:basename.:extension",:styles=>{:thumb => '160x160#',:small=>'50x50#',:medium=>'300x300#',:large=>'500x500#'}
validates_attachment_presence :image
validates_attachment_size :image, :less_than => 5.megabytes
validates :image_file_name, :presence=> true

end
