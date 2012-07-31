class Game < ActiveRecord::Base
  attr_accessible :users
  has_and_belongs_to_many :players, :class_name => 'User'
  has_many :rounds, :dependent => :destroy
  has_many :phrases, :through => :rounds
end
