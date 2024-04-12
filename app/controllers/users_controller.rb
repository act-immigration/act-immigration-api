class UsersController < ApplicationController
  before_action :authenticate_user!

  def show_profile
    user = User.find_by(email: params[:email])

    if user
      render json: { user: user }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
