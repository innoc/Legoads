class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
    t.integer :user_id
    t.string  :service_name
    t.string :description
    t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
