class Profile < ActiveRecord::Base
  has_one :ProfileImage
  belongs_to :user
  # attr_accessible :title, :body
end
