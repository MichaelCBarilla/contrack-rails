class AuthController < ApplicationController
  def login
  end

  def authenticate
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:alert] = "User not found"
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully."
  end
end
