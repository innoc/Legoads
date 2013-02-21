class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items,:force => true  do |t|
    t.string  :item_name
    t.column  :item_price,:double
    t.column  :partner_price,:double
    t.integer :user_id
    t.text    :description
    t.string  :category
    t.string  :item_status
    t.string  :item_condition
    t.string  :category_type
    t.string  :manufacturer
    t.column  :contact_number, :bigint
    t.string  :BlackBerry_pin
    t.timestamps  
    end
  end

  def self.down
    drop_table :items
  end
end
