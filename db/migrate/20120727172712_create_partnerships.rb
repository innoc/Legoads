class CreatePartnerships < ActiveRecord::Migration
  def self.up
    create_table :partnerships do |t|
    t.column :user_id, :integer
    t.column :partner_id, :integer
    t.column :status, :string
    t.column :created_at, :datetime
    t.column :accepted_at, :datetime
    t.timestamps
    end
  end

  def self.down
    drop_table :partnerships
  end
end

