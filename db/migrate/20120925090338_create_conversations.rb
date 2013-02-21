class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    t.timestamps
    t.integer :user_id
    t.integer :receiver_id
    end
  end
end
