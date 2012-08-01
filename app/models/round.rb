class Round < ActiveRecord::Base
  serialize :phrase_indicies, Array
  attr_accessible :game, :phrase, :phrase_indicies, :incorrect_answers
  belongs_to :game
  belongs_to :phrase
  after_initialize :init_phrase_indicies

  def update
    Rails.logger.debug phrase.to_yaml
  end

  private
  def init_phrase_indicies
    map = []
    phrase.content.gsub(/\s+/, "").split('').each do |char|
      map << 1
    end
    self.phrase_indicies = map
  end
end
