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
    if @user.id
      render json: {
        id: @user.id,
        username: @user.username
      }
    else
      render json: {
        message: @user.errors.messages
      }, status: :conflict
    end
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

  
  def login
    user = User.find_by(username: params['user']['username'])
    isAuthed = user.try(:authenticate, params['user']['password'])
    
    if !user
      render json: {
        key: 'username',
        message: 'No user can be found with that Username'
        }, status: :forbidden
      elsif !isAuthed
        render json: {
          key: 'password',
          message: 'Incorrect Password'
          }, status: :forbidden
      else
        session[:user_id] = user.id
        render json: {
          id: user.id,
          username: user.username,
          session: session
        }
        # byebug
    end
  end

      private
      def user_params
        params.require('user').permit(:username, :password)
      end
end
