class CreateCommentImages < ActiveRecord::Migration
  def self.up
    create_table :comment_images do |t|
      t.text :comment
      t.integer :image_id
      t.integer :user_id
      t.integer :comment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comment_images
  end
end
