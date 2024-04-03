class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    user.role = "client"
    if user.save
      render json: { message: 'User created successfully', user: }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
