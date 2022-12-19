require_relative '../../spec/spec_helper'
require_relative '../rucksack'
require_relative '../rucksack_collection'

RSpec.describe RucksackCollection do
  let(:sacks) do
    [ Rucksack.new(contents: "NGvdqJmJvpNbGRMGQgRsfgfn"),
      Rucksack.new(contents: "WlHTHShlLwSWjFRsncfbcwsgQc"),
      Rucksack.new(contents: "BHtSBHWHSCWLZHlhjTHLLdbNNqNpzpDzNvDvtPmmPp") ]
  end
  subject { RucksackCollection.new(sacks) }

  its(:common_item) { is_expected.to eq("b") }
  its(:priority_of_common_item) { is_expected.to eq(2) }
end
