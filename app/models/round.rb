class Round < ActiveRecord::Base
  serialize :phrase_indicies, Hash
  attr_accessible :game, :phrase, :phrase_indicies, :incorrect_answers
  belongs_to :game
  belongs_to :phrase
  before_create :init_phrase_indicies

  def set_data(letter, correct)
    self.update_attribute(:incorrect_answers, self.incorrect_answers += 1) if correct == false
    update_indicies(letter)
  end

  def data
    {phrase_indicies: self.phrase_indicies, incorrect_answers: self.incorrect_answers}
  end

  private
  def init_phrase_indicies
    Rails.logger.debug 'called init_phrase'
    self.phrase_indicies = {}
    words = phrase.content.split(' ')
    words.each_with_index do |word, index|
      self.phrase_indicies[index] = Array.new()
      word.split('').each do |char|
        self.phrase_indicies[index] << 0
      end
    end
  end

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
