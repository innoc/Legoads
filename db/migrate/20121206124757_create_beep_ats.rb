class CreateBeepAts < ActiveRecord::Migration
  def change
    create_table :beep_ats do |t|
     t.integer  :user_id
     t.integer  :beep_id
     t.timestamps
    end
  end
end
