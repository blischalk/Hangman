class Round < ActiveRecord::Base
  attr_accessible :game, :phrase
  belongs_to :game
  belongs_to :phrase
end
