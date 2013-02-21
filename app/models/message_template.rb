class MessageTemplate < ActiveRecord::Base
 has_many :jobs

def message_body(type,contact)
     case type
    when :email then eval '"' + self.item_name + '"'
    when :sms then eval '"' + self.sms_body + '"'
    else 'Incorrect type of message requested'
    end
end

validates :email, :presence => true,
:length => { :within => 5..50 },
:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
#{display_name}
end


