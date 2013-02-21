class CreateLastWords < ActiveRecord::Migration
  def change
    create_table :last_words do |t|
      t.text   :last_words
      t.timestamps
    end
  end
end
