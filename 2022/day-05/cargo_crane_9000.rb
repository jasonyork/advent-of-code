class CargoCrane9000
  attr_accessor :stacks, :instructions

  def initialize(stacks:)
    @stacks = stacks.clone.map(&:clone)
  end

  def move(instructions:)
    instructions.each do |i|
      i.qty.times { stacks[i.to-1].unshift(stacks[i.from-1].shift) }
    end
  end
end
