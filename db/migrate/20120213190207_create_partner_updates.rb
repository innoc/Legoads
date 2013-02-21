class CreatePartnerUpdates < ActiveRecord::Migration
  def self.up
    create_table :partner_updates do |t|
     t.integer :user_id
     t.integer :updater_id
     t.text :comment
     t.integer :item_id
     t.integer :event_style
     t.timestamps
    end
  end

  def self.down
    drop_table :partner_updates
  end
end
