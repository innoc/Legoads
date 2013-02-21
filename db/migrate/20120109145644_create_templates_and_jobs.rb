class CreateTemplatesAndJobs < ActiveRecord::Migration
  def self.up
    create_table :message_templates do |t|
      t.column 'send_time', :datetime
      t.column 'email', :text
      t.column 'item_name', :text
     end

   create_table :jobs do |t|
      t.column 'message_template_id', :integer
      t.column 'status', :string, :default => 'pending'
   end
 end

  def self.down
    drop_table :message_templates
    drop_table :jobs
  end
end
