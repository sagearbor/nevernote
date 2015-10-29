class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    # If thing on left is truthy then set it, then assign thing on right to it
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
