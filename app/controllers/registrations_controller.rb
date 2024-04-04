class RegistrationsController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])

    if user
      # User with this email already exists
      render json: { error: 'User with this email already exists' }, status: :conflict
    else
      # Create a new user
      user = User.new(user_params)
      user.role = "client"

      if user.save
        # User created successfully
        render json: { message: 'User created successfully', user: user }, status: :created
      else
        # Error creating user
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,)
  end
end
