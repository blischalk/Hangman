class HangmanController < ApplicationController
  respond_to :json
  def guess
    respond_with Guess.new(session[:game_id], params[:letter]).data
  end
end
