class Dislike < ActiveRecord::Base
  belongs_to :beep
  belongs_to :user
  # attr_accessible :title, :body
end
