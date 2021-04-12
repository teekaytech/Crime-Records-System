module FirstInformationReportsHelper
  def detect_status(status)
    case status
    when 'pending'
      'warning'
    when 'approved'
      'success'
    else
      'danger'
    end
  end
end
