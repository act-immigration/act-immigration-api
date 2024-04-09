class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      session[:user_id] = user.id # Set session user_id here

      if user.role == "admin"
        # Admin login
        render json: { user:, role: "admin" }, status: :ok
        Rails.logger.info("Admin #{user.email} logged in")
      else
        # Client login
        render json: { user:, role: "client" }, status: :ok
        Rails.logger.info("Client #{user.email} logged in")
      end
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logged out successfully' }, status: :ok
  end
end
