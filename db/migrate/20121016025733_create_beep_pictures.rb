class CreateBeepPictures < ActiveRecord::Migration
  def change
    create_table :beep_pictures do |t|
      t.integer  :user_id
      t.integer  :beep_id
      t.text :description
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
end
