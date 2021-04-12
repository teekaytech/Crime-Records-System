class SearchController < ApplicationController
  before_action :authenticate_user

  def index
    @result = { fir: nil, crime: nil, status: nil }
    return unless request.post?

    @result[:status] = true
    @result[:fir] = get_fir(params[:search_id]) if params[:search_query].eql?('fir')
    @result[:crime] = get_crime(params[:search_id]) if params[:search_query].eql?('crime')
  end

  private

  def get_fir(id)
    fir = FirstInformationReport.includes(%i[user complainant]).where(id: id).first
    return false if fir.nil?

    fir
  end

  def get_crime(id)
    crime = Crime.includes(%i[user categories]).where(id: id).first
    return false if crime.nil?

    crime
  end
end
