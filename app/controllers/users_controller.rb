class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show index edit update destroy]
  before_action :get_user, only: %i[index edit show]

  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user), notice: 'User profile updated successfully'
      else
        flash[:notice] = 'Profile update NOT successful'
        render :edit
      end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, notice: 'Something went wrong. Please try again.'
    end
  end

  def show
  end

  def destroy
    puts 'Hello world'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, :gender, :phone, :address, :avatar, :admin, :active)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
