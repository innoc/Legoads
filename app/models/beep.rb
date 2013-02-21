class Beep < ActiveRecord::Base
  has_many :feeds,:dependent=>:destroy
  belongs_to :user
  has_many :beep_comments,:dependent=>:destroy
  has_many :likes,:dependent=>:destroy
  has_many :joins
  has_one :beep_picture,:dependent=>:destroy
  has_many :dislikes,:dependent=>:destroy
  belongs_to :compete,:dependent=>:destroy
  has_one :notification,:dependent=>:destroy
  has_one :beep_at,:dependent=>:destroy

  validates :beep_content, :presence => true
 

  paginates_per 10
 
end
