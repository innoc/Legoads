class CreateUserImages < ActiveRecord::Migration
  def self.up
    create_table :user_images do |t|
      t.timestamps
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :user_id
  end
  end

  def self.down
    drop_table :user_images
  end
end
