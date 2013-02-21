class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
    t.integer :source_id
    t.integer :second_source_id
    t.integer :user_id
    t.string  :source
    t.string  :second_source
    t.integer :item_id
    t.integer :beep_id
    t.integer :compete_id
    t.string :third_source
    t.string :fought_source
    t.timestamps
    end
  end
end
