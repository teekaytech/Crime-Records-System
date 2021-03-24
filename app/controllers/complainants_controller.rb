class ComplainantsController < ApplicationController
  before_action :set_complainant, only: %i[ show edit update destroy ]

  # GET /complainants or /complainants.json
  def index
    @complainants = Complainant.all
  end

  # GET /complainants/1 or /complainants/1.json
  def show
  end

  # GET /complainants/new
  def new
    @complainant = Complainant.new
  end

  # GET /complainants/1/edit
  def edit
  end

  # POST /complainants or /complainants.json
  def create
    @complainant = Complainant.new(complainant_params)

    respond_to do |format|
      if @complainant.save
        format.html { redirect_to @complainant, notice: "Complainant was successfully created." }
        format.json { render :show, status: :created, location: @complainant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @complainant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complainants/1 or /complainants/1.json
  def update
    respond_to do |format|
      if @complainant.update(complainant_params)
        format.html { redirect_to @complainant, notice: "Complainant was successfully updated." }
        format.json { render :show, status: :ok, location: @complainant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @complainant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complainants/1 or /complainants/1.json
  def destroy
    @complainant.destroy
    respond_to do |format|
      format.html { redirect_to complainants_url, notice: "Complainant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complainant
      @complainant = Complainant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complainant_params
      params.require(:complainant).permit(:user_id, :surname, :firstname, :dob, :nationality, :address, :occupation, :phone, :gender, :criminal)
    end
end
