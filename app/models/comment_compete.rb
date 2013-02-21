class CommentCompete < ActiveRecord::Base
  belongs_to :user
  belongs_to :compete
  # attr_accessible :title, :body
end
