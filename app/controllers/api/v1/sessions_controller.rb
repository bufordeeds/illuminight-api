 class SessionsController < ApplicationController
  def create
    @user = User
    .find_by(username: params['user']['username'])
    .try(:authenticate, params['user']['password'])
    session[:current_user_id] = @user.id
  end

  def index
    current_index = User.find(session[:current_user_id])
  end
 end

 