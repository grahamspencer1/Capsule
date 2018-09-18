class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    if !current_user
      flash[:notice] = "You must be logged in!"
      redirect_to root_url
    end
  end
end
