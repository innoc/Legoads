class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string       :first_source
      t.integer      :user_id
      t.integer      :reviewer_id
      t.integer      :first_source_id
      t.string       :hidden_flag
      t.string       :compete_id
      t.integer      :message_id
      t.integer      :beep_id
      t.string       :notification_flag 
      t.timestamps
    end
  end
end
