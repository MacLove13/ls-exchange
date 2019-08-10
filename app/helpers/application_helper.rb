module ApplicationHelper

  def is_admin?
    return false if current_user.admin.nil?
    current_user.admin > 0
  end

end
