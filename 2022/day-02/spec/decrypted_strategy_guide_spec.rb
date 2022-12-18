require_relative '../../spec/spec_helper'
require_relative '../decrypted_strategy_guide'

RSpec.describe DecryptedStrategyGuide do
  let(:symbols) do
    [%w[A Y],
     %w[B X],
     %w[C Z]]
  end
  subject { DecryptedStrategyGuide.new(symbols:) }

  its(:rounds) { is_expected.to eq [[:rock, :rock], [:paper, :rock], [:scissors, :rock]] }

  describe "#shape_for_strategy" do
    subject { DecryptedStrategyGuide.new(symbols:).shape_for_strategy(strategy, opponent) }

    context "draw for rock" do
      let(:strategy) { :draw }
      let(:opponent) { :rock }
      it { is_expected.to eq(:rock)}
    end

    context "loss for paper" do
      let(:strategy) { :loss }
      let(:opponent) { :paper }
      it { is_expected.to eq(:rock)}
    end

    context "win for scissors" do
      let(:strategy) { :win }
      let(:opponent) { :scissors }
      it { is_expected.to eq(:rock)}
    end

    context "draw for scissors" do
      let(:strategy) { :draw }
      let(:opponent) { :scissors }
      it { is_expected.to eq(:scissors)}
    end
  end
end
