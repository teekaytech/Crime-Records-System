class ReportsController < ApplicationController
  before_action :authenticate_user

  def index
    return unless request.post?

    start_date = params[:start]
    end_date = params[:end]
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
      firs = FirstInformationReport.includes(%i[user complainant]).result(start_date, end_date)
      {
        start: start_date,
        end: end_date,
        firs: firs.any? ? firs.all : false,
        appr: firs.approved.size,
        pndg: firs.the_default.size,
        rjtd: firs.rejected.size
      }
    when 'crime'
      crimes = Crime.includes(%i[user categories]).result(start_date, end_date)
      active = crimes.all_active.size
      {
        start: start_date,
        end: end_date,
        crimes: crimes.any? ? crimes.all : false,
        active: active,
        inactive: crimes.size - active
      }
    else
      false
    end
  end
end
