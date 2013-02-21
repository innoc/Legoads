module JoinHelper

 def user_join(user,beep)
@beep_join = beep.joins
for beeper in @beep_join
 if beeper.user_id == user.id
 user_status = 1
 end
end

if user_status.nil?
return "no"
else
return "yes"
end
end
end
