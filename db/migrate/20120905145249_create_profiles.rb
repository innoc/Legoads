class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer  :profile_image_id
      t.string   :bg_color
      t.string   :font_color
      t.string   :content_holder
      t.integer  :user_id

      t.timestamps
    end
  end
end
