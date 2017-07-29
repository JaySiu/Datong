module CoreMembersHelper
  def reset_is_core_member
    users = User.all
    for user in users
      user.update_attributes({is_core_member: false})
    end
  end

  def set_is_core_member(user_ids)
    user_ids.map { |user_id| User.find(user_id).update_attributes({is_core_member: true}) }
  end
  
  def reset_is_event_admin
    users = User.all
    for user in users
      user.update_attributes({is_event_admin: false})
    end
  end

  def set_is_event_admin(user_ids)
    user_ids.map { |user_id| User.find(user_id).update_attributes({is_event_admin: true}) }
  end
end
