class FirstInformationReportsController < ApplicationController
  before_action :set_first_information_report, only: %i[ show edit update destroy ]

  # GET /first_information_reports or /first_information_reports.json
  def index
    @first_information_reports = FirstInformationReport.all
  end

  # GET /first_information_reports/1 or /first_information_reports/1.json
  def show
  end

  # GET /first_information_reports/new
  def new
    @first_information_report = FirstInformationReport.new
  end

  # GET /first_information_reports/1/edit
  def edit
  end

  # POST /first_information_reports or /first_information_reports.json
  def create
    @first_information_report = FirstInformationReport.new(first_information_report_params)

    respond_to do |format|
      if @first_information_report.save
        format.html { redirect_to @first_information_report, notice: "First information report was successfully created." }
        format.json { render :show, status: :created, location: @first_information_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @first_information_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_information_reports/1 or /first_information_reports/1.json
  def update
    respond_to do |format|
      if @first_information_report.update(first_information_report_params)
        format.html { redirect_to @first_information_report, notice: "First information report was successfully updated." }
        format.json { render :show, status: :ok, location: @first_information_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @first_information_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_information_reports/1 or /first_information_reports/1.json
  def destroy
    @first_information_report.destroy
    respond_to do |format|
      format.html { redirect_to first_information_reports_url, notice: "First information report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_information_report
      @first_information_report = FirstInformationReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def first_information_report_params
      params.require(:first_information_report).permit(:user_id, :complainant_id, :offense, :date, :location, :suspect_details)
    end
end
