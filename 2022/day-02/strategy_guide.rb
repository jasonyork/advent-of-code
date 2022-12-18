class StrategyGuide
  attr_accessor :symbols

  SHAPE_MAP = {
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors,
    "X" => :rock,
    "Y" => :paper,
    "Z" => :scissors
  }

  def initialize(symbols:)
    @symbols = symbols
  end

  def rounds
    symbols.map { |round| [SHAPE_MAP[round.first], SHAPE_MAP[round.last]] }
  end
end
