class CreateCompetes < ActiveRecord::Migration
  def change
    create_table :competes do |t|
      t.integer :user_id
      t.integer :oponent_id
      t.integer :original_beep
      t.timestamps
    end
  end
end
