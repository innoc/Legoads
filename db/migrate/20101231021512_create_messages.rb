class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.integer :receiver_id
      t.integer :conversation_id
      t.string :subject
      t.string :status
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
