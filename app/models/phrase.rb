class Phrase < ActiveRecord::Base
  attr_accessible :content
  has_many :rounds
  has_many :games, :through => :rounds
  validates_presence_of :content
end
