class CrimesController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, only: [:destroy]
  before_action :set_crime, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit]

  def index
    @crimes = Crime
      .includes(%i[user categories])
      .paginate(page: params[:page], per_page: 10)
      .order('created_at DESC')
  end

  def show
    render :'dashboard/not_found' if @crime.nil?
  end

  def new
    @crime = Crime.new
  end

  def edit
    render :'dashboard/not_found' if @crime.nil?
  end

  def create
    @crime = current_user.crimes.build(crime_params)
    if helpers.check_category(params[:categories])
      redirect_to new_crime_path(@crime), notice: 'Please select at least one category'
    elsif @crime.create_with_categories(params[:categories])
      redirect_to @crime, notice: 'Crime was successfully created.'
    else
      render :new, notice: 'Something went wrong. Please try again.'
    end
  end

  def update
    if helpers.check_category(params[:categories])
      redirect_to edit_crime_path(@crime), notice: 'Please select at least one category'
    end

    if @crime.update_with_categories(params[:categories], crime_params)
      redirect_to @crime, notice: 'Crime was successfully updated.'
    else
      render :edit, notice: 'Something went wrong. Please, try again.'
    end
  end

  def destroy
    @crime.destroy
    redirect_to crimes_url, notice: "Crime with ID: #{@crime.id} was successfully deleted."
  end

  private

  def set_crime
    @crime = Crime.includes(%i[user categories]).find_by(id: params[:id])
  end

  def set_categories
    @categories = Category.where(active: TRUE).all
  end

  def crime_params
    params.require(:crime).permit(:user_id, :accuser, :accused, :unknown_others, :date, :statements)
  end
end
