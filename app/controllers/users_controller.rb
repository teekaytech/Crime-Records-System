class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show index edit update destroy]
  before_action :authenticate_admin, except: %i[edit show update]
  before_action :now_user, only: %i[edit show toggle_role toggle_status]

  def index
    @users = User.paginate(page: params[:page], per_page: 15).order('id ASC')
  end

  def new
    @user = User.new
  end

  def edit
    return if now_user.eql?(current_user) || current_user.admin?

    render :'dashboard/not_found' if @user.nil?
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
      redirect_to users_path, notice: "User created successfully. Unique ID: #{@user.id}"
    else
      render :new, notice: 'Something went wrong. Please try again.'
    end
  end

  def show
    render :'dashboard/not_found' if @user.nil?
    return if now_user.eql?(current_user) || current_user.admin?

    flash[:notice] = 'You are not an admin!'
    redirect_back(fallback_location: users_path)
  end

  def destroy; end

  def toggle_role
    @user.admin = @user.admin.eql?(true) ? false : true
    msg = "User with id #{@user.id} role could not be updated."
    msg = "User with id #{@user.id} role updated to #{@user.admin ? 'Admin' : 'Officer'}." if @user.save
    flash[:notice] = msg
    redirect_to users_path
  end

  def toggle_status
    msg = ''
    @user.active = @user.active.eql?(true) ? false : true
    msg = "User with id #{@user.id} is NOW ACTIVE." if @user.active.eql?(true)
    msg = "User with id #{@user.id} is NOW INACTIVE." if @user.active.eql?(false)
    flash[:notice] = @user.save ? msg : 'User status cannot be changed!'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user)
      .permit(:email, :password, :firstname, :lastname, :gender, :phone, :address, :avatar, :admin, :active)
  end

  def now_user
    @user = User.find_by(id: params[:id])
  end
end
