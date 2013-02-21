class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
    t.string :hashed_password
    t.string :first_name
    t.string :last_name
    t.string :user_name
    t.column :mobile,:string
    t.string :email
    t.string :address
    t.string :state
    t.string :country
    t.integer :day
    t.integer :year
    t.integer :month
    t.string :user_type,:default=>'Regular'
    t.datetime :last_login
    t.string :reputation
    t.timestamps
   
    end
  end

  def self.down
    drop_table :users
  end
end
