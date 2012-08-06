require 'spec_helper'

describe Game do
  it 'should have a round' do
    game = FactoryGirl.build(:game)
    subject.rounds.count.should be(1)
  end
end
