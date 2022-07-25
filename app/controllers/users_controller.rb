class UsersController < ApplicationController

  def create
    user = User.create!(user_params)
    byebug
    render json:  user
  end

  private

  def user_params
    params.permit(:username, :password,:password_confirmation)
  end
end
