class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
    t.integer :item_id
    t.integer :commenter_id
    t.text :comment_text
    t.integer :comment_flag,:default=>1 #this is for new comment notification
    t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
