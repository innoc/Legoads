class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer  :beep_id
      t.integer  :user_id
      t.text     :hide
      t.timestamps
    end
  end
end
