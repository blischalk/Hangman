class Game < ActiveRecord::Base
  attr_accessible :users
  has_and_belongs_to_many :players, :class_name => 'User'
  has_many :rounds, :dependent => :destroy
  has_many :phrases, :through => :rounds
  before_create :build_game

  def current_round
    self.rounds.last
  end

  private
  def build_game
    self.players << User.new(username: 'blischalk')
    self.rounds.build(phrase: Phrase.offset(rand(Phrase.count)).first)
  end
end
