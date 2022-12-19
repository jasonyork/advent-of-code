require_relative '../../spec/spec_helper'
require_relative '../rucksack'

RSpec.describe Rucksack do
  let(:contents) { "vJrwpWtwJgWrhcsFMMfFFhFp" }
  subject { Rucksack.new(contents:) }

  describe "#initialize" do
    its(:compartment_one) { is_expected.to eq("vJrwpWtwJgWr".chars) }
    its(:compartment_two) { is_expected.to eq("hcsFMMfFFhFp".chars) }
  end

  its(:item_in_both_compartments) { is_expected.to eq("p") }
  its(:priority_of_item_in_both_compartments) { is_expected.to eq(16) }

  describe "#priority_for" do
    context "with a lowercase character" do
      it "returns the correct priority" do
        expect(subject.priority_for("a")).to eq(1)
      end
    end
    context "with a uppercase character" do
      it "returns the correct priority" do
        expect(subject.priority_for("A")).to eq(27)
      end
    end
  end
end
