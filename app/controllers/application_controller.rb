class ApplicationController < ActionController::Base
  def authenticate_user
    return unless current_user.nil?

    flash[:info] = 'You need to login'
    redirect_to login_path
  end

  def authenticate_admin
    return if current_user.admin?

    flash[:notice] = 'Only admins are allowed!'
    redirect_back(fallback_location: dashboard_index_path)
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if logged_in?
  end
end
