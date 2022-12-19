class CargoCrane9001
  attr_accessor :stacks, :instructions

  def initialize(stacks:)
    @stacks = stacks.clone.map(&:clone)
  end

  def move(instructions:)
    instructions.each do |i|
      cargo = stacks[i.from-1].shift(i.qty)
      stacks[i.to-1].unshift(*cargo)
    end
  end
end
