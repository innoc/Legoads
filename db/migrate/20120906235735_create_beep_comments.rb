class CreateBeepComments < ActiveRecord::Migration
  def change
    create_table :beep_comments do |t|
    t.integer  :beep_id
    t.integer  :user_id
    t.text     :beep_content
    t.text     :hide
    t.timestamps
    end
  end
end
