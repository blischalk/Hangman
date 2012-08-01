class MainController < ApplicationController
  def index
    game_config unless session[:game_id]
  end

  private
  def game_config
    @game = Game.new()
    if @game.save!
      session[:game_id] = @game.id
    end
  end
end
