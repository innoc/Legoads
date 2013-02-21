class CreateTabsEntries < ActiveRecord::Migration
  def self.up
    create_table :tabs_entries do |t|
      t.integer :tab_id
      t.string :comment
      t.integer :check
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tabs_entries
  end
end
