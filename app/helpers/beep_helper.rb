module BeepHelper
def beep_status(beep)
beep_support = beep.likes
beep_against = beep.dislikes

return "winning" if beep_support.count > beep_against.count

return "losing" if beep_support.count < beep_against.count

end

def is_this_a_hot_beep(beep)
beep_support = beep.likes
beep_against = beep.dislikes

return "yes" if beep_support.count + beep_against.count > 0

return "no" if beep_support.count + beep_against.count <=0

end


end
