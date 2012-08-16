class MainController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json, :html
  def index
    if session[:game_id]
      game_retrieve
    else
      game_config
    end
    update_public_data
  end

  def new_round
    game_config
    respond_to do |format|
      format.json { render json: @game.current_round.data }
    end
  end

  private
  def game_config
    @game = Game.new()
    if @game.save!
      session[:game_id] = @game.id
    end
  end

  def game_retrieve
    begin
      @game = Game.find(session[:game_id])
    rescue ActiveRecord::RecordNotFound
      game_config
    end
  end

  def update_public_data
    @round_data = @game.current_round.data
  end
end
