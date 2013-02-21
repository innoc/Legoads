class CreateTabs < ActiveRecord::Migration
  def self.up
    create_table :tabs do |t|
      t.string  :name
      t.string  :user_name
      t.string  :email
      t.string  :tab_type
      t.timestamps
    end
  end

  def self.down
    drop_table :tabs
  end
end
