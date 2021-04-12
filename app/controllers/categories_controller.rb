class CategoriesController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, only: %i[edit update destroy]
  before_action :set_category, only: %i[show edit update destroy]
  def index
    @categories = Category.all
  end

  def show
    render :'dashboard/not_found' if @category.nil?
  end

  def new
    @category = Category.new
  end

  def edit
    render :'dashboard/not_found' if @category.nil?
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.active = @category.active ? false : true
    @category.save
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully updated.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.includes(:user).find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
