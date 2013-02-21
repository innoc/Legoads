class Conversation < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :messages
  belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
  validates :user_id,:receiver_id,:presence => true


  
end
