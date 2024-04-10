class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      session[:user_id] = user.id # Set session user_id here

      if user.role == "admin"
        # Admin login
        render json: { user: user, role: "admin" }, status: :ok
        log_user_activity(user, "Admin #{user.email} logged in")
      else
        # Client login
        render json: { user: user, role: "client" }, status: :ok
        log_user_activity(user, "Client #{user.email} logged in")
      end
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    reset_session
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  private

  def log_user_activity(message)
    Rails.logger.info(message)
  end
end
