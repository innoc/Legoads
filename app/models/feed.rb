class Feed < ActiveRecord::Base
 belongs_to :beep
 belongs_to :item
 belongs_to :compete
 paginates_per 10





end
