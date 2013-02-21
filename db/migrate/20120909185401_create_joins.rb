class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer  :beep_id
      t.integer  :user_id
      t.text     :hide
      t.timestamps
    end
  end
end
