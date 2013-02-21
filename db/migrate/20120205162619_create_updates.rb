class CreateUpdates < ActiveRecord::Migration
  def self.up
    create_table :updates do |t|
      t.text :comment
      t.integer :user_id
      t.integer  :updater_id
      t.timestamps
    end
  end

  def self.down
    drop_table :updates
  end
end
