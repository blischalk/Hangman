class User < ActiveRecord::Base
  attr_accessible :username
  has_and_belongs_to_many :games
end
