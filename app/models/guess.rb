class Guess
  def initialize(game_id, letter)
    set_instance_vars(game_id, letter)
    guess_check
  end

  def set_instance_vars(game_id, letter)
    @letter = letter
    @game = Game.find(game_id)
  end

  def guess_check
    correct = guess_correct?
    @game.current_round.set_data(@letter, correct)
  end

  def guess_correct?
    return @correct_answer if @correct_answer
    @correct_answer = @game.current_round.phrase.content =~ /#{@letter}/ ? true : false
  end

  def data
    @game.current_round.data
  end
end
