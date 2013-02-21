class CreateFindFriends < ActiveRecord::Migration
  def change
    create_table :find_friends do |t|
      t.string :name
      t.string :user_name
      t.string :email
      t.timestamps
    end
  end
end
