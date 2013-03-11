class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
