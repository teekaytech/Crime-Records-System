module ApplicationHelper
  def format_time(time, format=:long, blank_message='&nbsp;')
    time.blank? ? blank_message : time.to_s(format)
  end
end
