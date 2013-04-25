module ApplicationHelper
  def is_internal?
    current_user.trip_permissions.where("permission = ?", 1) != [] or current_user.admin_permission != nil
  end
end
