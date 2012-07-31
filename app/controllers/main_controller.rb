class MainController < ApplicationController
  def index
    game_config unless session[:game_id]
  end

  private
  def game_config
    @game = Game.new()
    phrase = Phrase.offset(rand(Phrase.count)).first
    user = User.new(username: 'blischalk')
    @game.players << user
    @game.rounds.build(phrase: phrase)
    if @game.save!
      session[:game_id] = @game.id
    end
  end
end
