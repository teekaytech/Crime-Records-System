class CrimesController < ApplicationController
  before_action :set_crime, only: %i[show edit update destroy]

  def index
    @crimes = Crime
      .includes(%i[user categories])
      .paginate(page: params[:page], per_page: 10)
      .order('created_at DESC')
  end

  def show; end

  def new
    @crime = Crime.new
  end

  def edit; end

  def create
    @crime = Crime.new(crime_params)

    respond_to do |format|
      if @crime.save
        format.html { redirect_to @crime, notice: 'Crime was successfully created.' }
        format.json { render :show, status: :created, location: @crime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @crime.update(crime_params)
        format.html { redirect_to @crime, notice: 'Crime was successfully updated.' }
        format.json { render :show, status: :ok, location: @crime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @crime.destroy
    respond_to do |format|
      format.html { redirect_to crimes_url, notice: 'Crime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_crime
    @crime = Crime.includes(%i[user categories]).find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:user_id, :category_id, :accuser, :accused, :unknown_others, :date, :statements)
  end
end
