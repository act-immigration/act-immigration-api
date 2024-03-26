class AuthController < ApplicationController
  def sign_in
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: { user: }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
