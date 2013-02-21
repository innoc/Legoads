class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :user_id
      t.integer :user_point
      t.string  :rank_type
      t.timestamps
    end
  end
end
