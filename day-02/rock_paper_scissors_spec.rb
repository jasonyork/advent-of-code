require_relative 'rock_paper_scissors'
require_relative '../spec/spec_helper'

RSpec.describe RockPaperScissors do
  let(:rounds) do
    [[:rock, :paper], [:paper, :rock], [:scissors, :scissors]]
  end
  subject { RockPaperScissors.new(rounds:) }

  it { is_expected.to be_a RockPaperScissors }
  its(:total_score) { is_expected.to eq(15) }

  describe "#outcome_for" do
    subject { RockPaperScissors.new(rounds:) }
    let(:matches){
      [ [:rock, :rock, :draw],
        [:rock, :paper, :loss],
        [:rock, :scissors, :win],
        [:paper, :rock, :win],
        [:paper, :paper, :draw],
        [:paper, :scissors, :loss],
        [:scissors, :rock, :loss],
        [:scissors, :paper, :win],
        [:scissors, :scissors, :draw] ]
    }
    it "resolves each match correctly" do
      matches.each do |player, opponent, result|
        expect(subject.outcome_for(player, opponent)).to eq(result)
      end
    end
  end
end
