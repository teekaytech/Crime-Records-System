module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end

  def format_time(time, format=:long, blank_message='&nbsp;')
    time.blank? ? blank_message : time.to_s(format)
  end

  def id_formatter(id)
    id.to_s.rjust(4, '0')
  end
end
