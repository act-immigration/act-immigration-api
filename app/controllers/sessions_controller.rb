class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      render json: { user: }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end
end
