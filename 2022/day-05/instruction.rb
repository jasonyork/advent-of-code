class Instruction
  attr_reader :qty, :from, :to

  def initialize(qty:, from:, to:)
    @qty = qty
    @from = from
    @to = to
  end

  def self.from_text(text:)
    match = text.match /move (?<qty>\d+) from (?<from>\d+) to (?<to>\d+)/
    new(**match.named_captures.transform_keys(&:to_sym).transform_values(&:to_i))
  end
end

