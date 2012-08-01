class MainController < ApplicationController
  respond_to :json, :html
  def index
    game_config unless session[:game_id]
  end

  def guess
    respond_with Guess.new(session[:game_id], params[:letter]).data
  end

  private
  def game_config
    @game = Game.new()
    if @game.save!
      session[:game_id] = @game.id
      update_public_data
    end
  end

  def update_public_data
    @phrase_indicies = @game.current_round.phrase_indicies
    @incorrect_answers = @game.current_round.incorrect_answers
  end
end
