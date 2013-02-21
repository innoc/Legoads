class Compete < ActiveRecord::Base
  belongs_to :user
  has_one  :beep
  has_many :comment_competes,:dependent=>:destroy
  has_one  :notification, :dependent=>:destroy
  has_many :feeds,:dependent=>:destroy
  
  # attr_accessible :title, :body
end
