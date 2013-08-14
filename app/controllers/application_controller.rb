class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    if !logged_in?
      session[:return_to_url] = request.url if request.get?
      redirect_to login_path, notice: "Login or Create Account"
      return
    end
  end

  def require_post_ownership
    unless current_user && current_user.id == @post.user_id
      redirect_to new_sessions_path, notice: "You are not authorized"
    end
  end
end
