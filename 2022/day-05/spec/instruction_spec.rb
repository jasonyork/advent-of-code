require_relative '../../spec/spec_helper'
require_relative '../instruction'

RSpec.describe Instruction do
  let(:text) { "move 1 from 2 to 3" }

  describe ".from_text" do
    subject { Instruction.from_text(text:) }

    its(:qty) { is_expected.to eq(1) }
    its(:from) { is_expected.to eq(2) }
    its(:to) { is_expected.to eq(3) }
  end
end

