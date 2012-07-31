class HangmanController < ApplicationController
  respond_to :json
  def guess
    phrase = get_phrase_text
    found = guess_correct?(phrase)
    respond_with found.to_json
  end

  private
  def get_phrase_text
    game = Game.find(session[:game_id])
    round = game.rounds.last
    round.phrase.content
  end
  def guess_correct?(phrase)
    phrase =~ /#{params[:letter]}/ ? true : false
  end
end
