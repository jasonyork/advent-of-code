require_relative 'strategy_guide'
require_relative '../spec/spec_helper'

RSpec.describe StrategyGuide do
  let(:symbols) do
    [%w[A Y],
     %w[B X],
     %w[C Z]]
  end
  subject { StrategyGuide.new(symbols:) }

  its(:rounds) { is_expected.to eq [[:rock, :paper], [:paper, :rock], [:scissors, :scissors]] }
end
