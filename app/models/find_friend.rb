class FindFriend < ActiveRecord::Base
validates :name, :presence => true
validates :email,:presence => true
validates :email, 
:length => { :within => 5..50 },
:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
end
