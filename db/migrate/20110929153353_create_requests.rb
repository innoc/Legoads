class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
    t.string :user_name
    t.string :item_name
    t.string :email
    t.string :description
    t.string :cost
    t.string :flag
    t.timestamps
  end
 end

  def self.down
    drop_table :requests
  end
end




