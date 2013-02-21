class CreateCommentCompetes < ActiveRecord::Migration
  def change
    create_table :comment_competes do |t|
      t.integer  :compete_id
      t.integer  :user_id
      t.text     :content
      t.timestamps
    end
  end
end
