require_relative '../../spec/spec_helper'
require_relative '../tree_map'

RSpec.describe TreeMap do
  describe ".from_lines" do
    let(:trees) do
      %w[30373 25512 65332 33549 35390]
    end
    subject { TreeMap.from_lines(trees) }
    it { is_expected.to eq TreeMap[[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]] }
  end

  describe "#visible_map" do
    let(:trees) { [[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]] }
    subject { TreeMap.rows(trees).visible_map }
    it { is_expected.to eq Matrix[[1, 1, 1, 1, 1],
                                  [1, 1, 1, 0, 1],
                                  [1, 1, 0, 1, 1],
                                  [1, 0, 1, 0, 1],
                                  [1, 1, 1, 1, 1]] }
  end

  describe "#visible_count" do
    let(:trees) { [[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]] }
    subject { TreeMap.rows(trees).visible_count }
    it { is_expected.to eq(21) }
  end

  describe "#visibility_score_map" do
    let(:trees) { [[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]] }
    subject { TreeMap.rows(trees).visibility_score_map }

    it { is_expected.to eq(Matrix[[0, 0, 0, 0, 0], [0, 1, 4, 1, 0], [0, 6, 1, 2, 0], [0, 1, 8, 3, 0], [0, 0, 0, 0, 0]]) }
  end

  describe "#highest_visibility_score" do
    let(:trees) { [[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]] }
    subject { TreeMap.rows(trees).highest_visibility_score }

    it { is_expected.to eq(8) }
  end
end
