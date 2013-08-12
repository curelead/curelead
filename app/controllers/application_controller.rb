class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_profile
    if current_user
      @user = current_user
    else
      redirect_to new_sessions_path, notice: "must be logged in to post a pair"
      return
    end
  end
end
