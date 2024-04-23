class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    user = User.find_by(email: params[:email])
    avatar = rails_blob_path(user.avatar, only_path: true) if user.avatar.attached?
    if user.password == params[:password]
      render json: { user:, avatat: avatar, status: :ok }
    else
      render json: { error: 'User not found' }, status: :not_found

    end
  end

  def show_profile
    user = current_user
    profile = user.profile

    if profile
      render json: { user:, profile: }, status: :ok
    else
      render json: { error: 'Profile not found' }, status: :not_found
    end
  end
end
