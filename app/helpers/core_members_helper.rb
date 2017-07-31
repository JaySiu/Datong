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
end
