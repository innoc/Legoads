class UserImage < ActiveRecord::Base
  belongs_to :user
  attr_accessible :image

  has_attached_file :image,:styles=>{:thumb => '96x96#',:small=>'30x30#',:moderate=>'40x40#',:mid =>'50x50>',:medium => '200x200#',:large=>'400x400'}
  validates_attachment_presence :image
  validates :image_file_name, :presence=>true
end
