class CreatePartners < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
      t.integer "inviter_id"
      t.integer "invited_id"
      t.integer "status"
      t.integer "request_flag"
      t.timestamps
    end
  end

  def self.down
    drop_table :partners
  end
end
