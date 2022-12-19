require_relative '../../spec/spec_helper'
require_relative '../cargo_crane_9000'
require_relative '../instruction'

RSpec.describe CargoCrane9000 do
  let(:stacks) { [%w[N Z], %w[D C M], %w[P]] }

  subject { CargoCrane9000.new(stacks:) }

  describe "#move" do
    let(:instructions) do
      [Instruction.new(qty: 1, from: 2, to: 1),
       Instruction.new(qty: 3, from: 1, to: 3),
       Instruction.new(qty: 2, from: 2, to: 1),
       Instruction.new(qty: 1, from: 1, to: 2)]
    end

    it "moves the cargo according to the instructions" do
      subject.move(instructions:)
      expect(subject.stacks).to eq([%w[C], %w[M], %w[Z N D P]])
    end
  end
end

