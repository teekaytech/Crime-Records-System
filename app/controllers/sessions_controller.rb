class SessionsController < ApplicationController
  def index
    redirect_to dashboard_index_path if current_user
  end

  def create
    @user = User.find_by(email: params[:email])

    return redirect_to login_path, notice: 'Your account has been deactivated. Contact the Admin' unless @user.active

    if !@user.nil? && @user.authenticate(params[:password])
      helpers.log_in(@user)
      flash[:success] = 'Login successful! Welcome to your dashboard.'
      redirect_to dashboard_index_path
    else
      message = 'Something went wrong! Please check your username and password.'
      redirect_to login_path, notice: message
    end
  end

  def destroy
    helpers.log_out
    redirect_to root_url, notice: 'Logout successful!'
  end
end
