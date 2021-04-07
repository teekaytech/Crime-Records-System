module FirstInformationReportsHelper
  def detect_status(status)
    if status.eql?('pending')
      'warning'
    elsif status.eql?('approved')
      'success'
    else
      'danger'
    end
  end
end
