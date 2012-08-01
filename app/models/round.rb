class Round < ActiveRecord::Base
  serialize :phrase_indicies, Hash
  attr_accessible :game, :phrase, :phrase_indicies, :incorrect_answers
  belongs_to :game
  belongs_to :phrase
  after_initialize :init_phrase_indicies

  def update
    Rails.logger.debug phrase.to_yaml
  end

  private
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
end
