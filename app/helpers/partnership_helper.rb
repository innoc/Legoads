module PartnershipHelper
def partnership_status(user, friend)
partnership = Partnership.find_by_user_id_and_partner_id(user, friend)
return "#{friend.user_name} is not your partner(yet)." if partnership.nil?
case partnership.status
when 'requested'
"#{friend.user_name} would like to be your partner."
when 'pending'
"You have requested partnership from #{friend.user_name}."
when 'accepted'
"#{friend.user_name} is your partner."
end
end
def partnership_indicator(user, friend)
partnership = Partnership.find_by_user_id_and_partner_id(user, friend)
return "yes" if partnership.nil?
case partnership.status
when 'accepted'
"yes_boss"
end
end
def partnership_pending(user, friend)
partnership = Partnership.find_by_user_id_and_partner_id(user, friend)
return "yes" if partnership.nil?
case partnership.status
when 'pending'
"yes_boss"
end
end
end
