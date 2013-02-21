class ProfileImage < ActiveRecord::Base
  belongs_to :profile

 

 attr_accessible :image
 has_attached_file :image,:path =>"C:/Users/mummy/LagoAds/public/:class/:attachment/:id/:style_:basename.:extension",:url=>"/:class/:attachment/:id/:style_:basename.:extension",:styles=>{:medium => '668x400'}
 validates_attachment_presence :image
 validates :image_file_name, :presence=> true
 validate :file_dimensions, :unless => "errors.any?"



def file_dimensions
  dimensions =Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
  if dimensions.width < 668 && dimensions.height < 252
    errors.add(:image,'Width and height must be at least 668x252px')
  end
end

end