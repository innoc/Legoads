class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer  :beep_id
      t.integer  :user_id
      t.text     :hide
      t.timestamps
    end
  end
end
