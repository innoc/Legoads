class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :compete
  belongs_to :beep
  belongs_to :reviewer, :class_name => "User", :foreign_key => "reviewer_id"
  # attr_accessible :title, :body
end
