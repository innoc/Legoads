class CreateFeedBacks < ActiveRecord::Migration
  def self.up
    create_table :feed_backs do |t|
      t.string :comment
      t.integer :like
      t.integer :hate
      t.timestamps
    end
  end

  def self.down
    drop_table :feed_backs
  end
end
