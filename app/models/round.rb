class Round < ActiveRecord::Base
  serialize :phrase_indicies, Hash
  attr_accessible :game, :phrase, :phrase_indicies, :incorrect_answers
  belongs_to :game
  belongs_to :phrase
  before_create :init_phrase_indicies

  # Set the round data attributes including:
  # - incorrect answers
  # - phrase indicies
  def set_data(letter, correct)
    # If the answer was incorrect
    self.update_attribute(:incorrect_answers, self.incorrect_answers += 1) if correct == false
    update_indicies(letter)
  end

  # Returns round data
  # Round data includes incorrect answers
  # and phrase indicies data structure
  def data
    {phrase_indicies: self.phrase_indicies, incorrect_answers: self.incorrect_answers}
  end

  private
  # create a data structure for a phrase
  # The data structure is a hash of arrays
  # Each array represents a word
  # The arrays include an initial 0 for each letter
  # in the phrase
  # ex. phrase
  # {
  #   0 => [0,0,0,0],
  #   1 => [0,0,0],
  #   2 => [0,0,0,0]
  # }
  def init_phrase_indicies
    self.phrase_indicies = {}
    words = phrase.content.split(' ')
    words.each_with_index do |word, index|
      self.phrase_indicies[index] = Array.new()
      word.split('').each do |char|
        self.phrase_indicies[index] << 0
      end
    end
  end

  # Update the data structure
  # setup in init_phrase_indicies
  # Changes 0's in the word arrays
  # to the letter passed into the method
  def update_indicies(letter)
    words = phrase.content.split(' ')
    words.each_with_index do |word, index|
      word.split('').each_with_index do |char,i|
        self.phrase_indicies[index][i] = char if char == letter
      end
    end
    self.update_attribute(:phrase_indicies, self.phrase_indicies)
  end
end
