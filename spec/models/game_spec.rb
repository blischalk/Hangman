require 'spec_helper'

describe Game do
  context "#before_create" do
    subject { FactoryGirl.create(:game_full) }
    its('players.first.username') { should == 'blischalk' }
  end
  context "with associations" do
    # we can't do create here yet because
    # we are hard building rounds in a before_create
    subject { FactoryGirl.build(:game_full) }
    its('rounds.size') { should == 1 }
    its('rounds.first.phrase.content') { should == 'This is a testing phrase' }
    context "#current_round" do
      its(:current_round) { should be_a(Round) }
    end
  end
end
