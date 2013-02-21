module DislikeHelper
def user_notify_dislike(user,beep)
@beep_like = beep.dislikes
for beeper in @beep_like
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
