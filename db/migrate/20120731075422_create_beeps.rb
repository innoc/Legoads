class CreateBeeps < ActiveRecord::Migration
   def self.up
    create_table :beeps do |t|
    t.integer :user_id
    t.text :beep_content
    t.string :scope
    t.string :quote_flag
    t.integer :quoted_user
    t.integer :quoted_beep
    t.integer :beeped_at
    t.integer  :compete_id
    t.timestamps
    end
    end
 

  def self.down
    drop_table :beeps
  end

end
