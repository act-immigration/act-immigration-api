class UsersController < ApplicationController
  before_action :authenticate_user!

  def show_profile
    user = current_user
    profile = user.profile

    if profile
      render json: { user: user, profile: profile }, status: :ok
    else
      render json: { error: 'Profile not found' }, status: :not_found
    end
  end
end
