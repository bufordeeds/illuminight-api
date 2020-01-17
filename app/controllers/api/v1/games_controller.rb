class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  def index
    @games = Game.all
    render json: @games
  end
  def show
    render json: @game
  end
  def create
    @game = Game.create(game_params)
    render json: @game
  end
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end
  def destroy
    @game.destroy
  end
  def set_game
    @game = Game.find(params[:id])
  end
  def game_params()
    params.require(:game).permit(:user_id, :clicks, :time, :level, :score)
  end
end
