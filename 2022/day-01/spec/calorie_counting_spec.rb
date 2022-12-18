require_relative '../../spec/spec_helper'
require_relative '../calorie_counting'

RSpec.describe CalorieCounting do
  let(:calorie_packs) do
    [[1000, 2000, 3000],
     [4000],
     [5000, 6000],
     [7000, 8000, 9000],
     [10000]]
  end
  subject { CalorieCounting.new(calorie_packs:) }

  it { is_expected.to be_a CalorieCounting }
  its(:most_calories) { is_expected.to eq(24000) }
  its(:top_three) { is_expected.to eq(45000) }
end
