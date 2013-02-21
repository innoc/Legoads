class Oppose < ActiveRecord::Base
 belongs_to :user
  belongs_to :beep
  attr_accessible :beep_id, :user_id,:content
end
