class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    unless user_signed_in?
      redirect_to root_path
    end
  end


  # redirect to dashboard after sign in
  private
  def stored_location_for(resource_or_scope)
    nil
  end
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end
  
end
