class CreateProfileFeeds < ActiveRecord::Migration
  def change
    create_table :profile_feeds do |t|
      t.integer :user_id
      t.integer :second_user_id
      t.string  :action
      t.integer :beep_id
      t.integer :source_id 
      t.timestamps
    end
  end
end
