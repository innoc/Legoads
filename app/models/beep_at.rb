class BeepAt < ActiveRecord::Base
# attr_accessible :title, :body
belongs_to :beep,:dependent=>:destroy
belongs_to :users

  end
