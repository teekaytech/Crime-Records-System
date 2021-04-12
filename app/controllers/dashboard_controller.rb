class DashboardController < ApplicationController
  before_action :authenticate_user
  def index
    @officers = User.where(admin: false).all.count
    @complainants = Complainant.all.count

    p_firs = FirstInformationReport.where(status: 0)
    @pending_firs = p_firs.nil? ? 0 : p_firs.all

    @firs = FirstInformationReport.all.order(created_at: :desc).limit(10)

    @crimes = Crime.includes(%i[categories user]).all.order(created_at: :desc).limit(7)
  end
end
