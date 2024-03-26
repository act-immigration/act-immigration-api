class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      # Handle successful signup
      redirect_to root_path, notice: 'User created successfully'
    else
      # Handle signup failure
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
