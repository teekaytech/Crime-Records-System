class ApplicationController < ActionController::Base
  def authenticate_user
    return unless current_user.nil?

    flash[:info] = 'You need to login'
    redirect_to login_path
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end
end
