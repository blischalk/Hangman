class MainController < ApplicationController
  respond_to :json, :html
  def index
    if session[:game_id]
      game_retrieve
    else
      game_config
    end
    update_public_data
  end

  def guess
    respond_with Guess.new(session[:game_id], params[:letter]).data
  end

  private
  def game_config
    @game = Game.new()
    if @game.save!
      session[:game_id] = @game.id
    end
  end

  def game_retrieve
    @game = Game.find(session[:game_id])
  end

  def update_public_data
    @round_data = @game.current_round.data
  end
end
