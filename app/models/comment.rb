class Comment < ActiveRecord::Base
belongs_to :item
validates :comment_text, :presence => true

end


