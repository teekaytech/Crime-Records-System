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
      fir_records(start_date, end_date)
    when 'crime'
      crime_records(start_date, end_date)
    else
      false
    end
  end

  def fir_records(st_d, en_d)
    firs = FirstInformationReport.includes(%i[user complainant]).result(st_d, en_d)
    {
      start: st_d,
      end: en_d,
      firs: firs.any? ? firs.all : false,
      appr: firs.the_approved.size,
      pndg: firs.the_default.size,
      rjtd: firs.the_rejected.size
    }
  end

  def crime_records(st_d, en_d)
    crimes = Crime.includes(%i[user categories]).result(st_d, en_d)
    active = crimes.all_active.size
    {
      start: st_d,
      end: en_d,
      crimes: crimes.any? ? crimes.all : false,
      active: active,
      inactive: crimes.size - active
    }
  end
end
