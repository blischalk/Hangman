require 'spec_helper'

describe Round do
  context "when initialized" do
    let(:round) { Round.create(phrase: FactoryGirl.create(:phrase)) }
    its(:phrase_indicies) { should be_a(Hash) }
    context "#set_data" do
      it 'should have an incorrect answer' do
        round.set_data('a', false)
        round.incorrect_answers.should be(1)
      end
      it 'should not have an incorrect answer' do
        round.set_data('a', true)
        round.incorrect_answers.should be(0)
      end
    end
    context "#data" do
      its(:data) { should == { phrase_indicies: {}, incorrect_answers: 0 } }
    end
    it 'updates phrase indicies'
  end
end
