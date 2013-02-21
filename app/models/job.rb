class Job < ActiveRecord::Base
	belongs_to :message_template
end
