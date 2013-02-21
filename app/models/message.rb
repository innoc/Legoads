class Message < ActiveRecord::Base
belongs_to :user
belongs_to :conversation
validates :user_id, :presence => true
validates :receiver_id, :presence => true
validates :status, :presence => true
validates :body, :presence => true

def self.exists?(user,receiver)
first_case = self.find_by_user_id_and_receiver_id(user,receiver)
second_case = self.find_by_user_id_and_receiver_id(receiver,user)
return "no" if first_case.blank? and second_case.blank?
end


end
