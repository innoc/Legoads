class CreateGameNumbers < ActiveRecord::Migration
  def self.up
    create_table :game_numbers do |t|
      t.integer :number
      t.timestamps
    end
  end

  def self.down
    drop_table :game_numbers
  end
end
