class ReportsController < ApplicationController
  def index

    return unless request.post?

    start_date = Time.zone.parse(params[:start])
    end_date = Time.zone.parse(params[:end])
    entity = params[:query]

    if start_date.nil? || end_date.nil? || entity.empty?
      redirect_to get_report_form_path, notice: 'All fields are compulsory.'
    end

    @result = get_data(entity, start_date, end_date)
  end

  private

  def report_params
    params.permit(:start, :end, :query)
  end

  def get_data(entity, start_date, end_date)
    case entity
    when 'fir'
      FirstInformationReport.result(start_date, end_date)
    when 'crime'
      Crime.result(start_date, end_date)
    else
      false
    end
  end
end
