class Partnership < ActiveRecord::Base

belongs_to :user
belongs_to :partner, :class_name => "User", :foreign_key => "partner_id"
validates :user_id,:partner_id, :presence => true

attr_accessible :user_id, :partner_id,:status

# Return true if the users are (possibly pending) friends.
def self.exists?(user,partner)
not find_by_user_id_and_partner_id(user, partner).nil?
end

def self.request(user,partner)
transaction do
create(:user_id=>user, :partner_id=>partner, :status => 'pending')
create(:user_id=>partner, :partner_id=> user, :status => 'requested')
end
end




# Accept a friend request.
def self.accept(user,partner)
transaction do
accepted_at = Time.now
accept_one_side(user, partner, accepted_at)
accept_one_side(partner, user, accepted_at)
end
end

def self.breakup(user,partner)
transaction do
destroy(find_by_user_id_and_partner_id(user,partner))
destroy(find_by_user_id_and_partner_id(partner,user))
end
end


private
# Update the db with one side of an accepted friendship request.
def self.accept_one_side(user,partner, accepted_at)
request = find_by_user_id_and_partner_id(user, partner)
request.status = 'accepted'
request.accepted_at = accepted_at
request.save!
end

end
