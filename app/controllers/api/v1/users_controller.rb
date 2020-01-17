class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  def index
    @users = User.all
    render json: @users
  end
  def show
    render json: @user
  end
  def create
    @user = User.create(user_params)
    render json: @user
  end
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @user.destroy
  end
  def set_user
    @user = User.find(params[:id])
  end
  def user_params()
    params.require(:user).permit(:username)
  end

end
