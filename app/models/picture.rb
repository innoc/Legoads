class Picture < ActiveRecord::Base
 belongs_to :item
 attr_accessible :image
 
 has_attached_file :image,:path =>"C:/Users/mummy/LagoAds/public/:class/:attachment/:id/:style_:basename.:extension",:url=>"/:class/:attachment/:id/:style_:basename.:extension",:styles=>{:thumb => '100x100#',:small=>'50x50#',:moderate =>'150x150#',:medium=>'200x200#'}
 validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
 validates :image_file_name, :presence=> true


  end





