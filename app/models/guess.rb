class Guess
  def initialize(game_id, letter)
    set_instance_vars(game_id, letter)
    guess_check
  end

  def set_instance_vars(game_id, letter)
    @letter = letter
    @game = Game.find(game_id)
    @round = @game.rounds.last
  end

  def guess_check
    if guess_correct?
      @round.update
    end
  end

  def guess_correct?
    return @correct_answer if @correct_answer
    @correct_answer = @round.phrase.content =~ /#{@letter}/ ? true : false
  end

  def data
    if guess_correct?
      'guess was correct'.to_json
    else
      'guess was incorrect'.to_json
    end
  end

end
