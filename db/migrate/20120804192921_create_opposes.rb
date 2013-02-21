class CreateOpposes < ActiveRecord::Migration
  def change
    create_table :opposes do |t|
    t.integer  :beep_id
    t.integer  :user_id
    t.text     :content
    t.text     :hide
    t.timestamps
   end
  end
end
