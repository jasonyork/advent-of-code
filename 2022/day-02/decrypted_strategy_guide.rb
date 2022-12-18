require_relative 'strategy_guide'

class DecryptedStrategyGuide < StrategyGuide
  SHAPE_MAP = {
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors,
  }

  STRATEGY_MAP = {
    "X" => :loss,
    "Y" => :draw,
    "Z" => :win
  }

  PRECEDENCE = [:rock, :scissors, :paper]

  def rounds
    symbols.map { |round| decrypted_round(round) }
  end

  def decrypted_round(round)
    shape = shape_for_strategy(STRATEGY_MAP[round.last], SHAPE_MAP[round.first])
    [SHAPE_MAP[round.first], shape]
  end

  def shape_for_strategy(strategy, opponent)
    return opponent if strategy == :draw
    return winner_against(opponent) if strategy == :win

    loser_against(opponent)
  end

  def winner_against(opponent)
    centered_precedence(opponent).at(0)
  end

  def loser_against(opponent)
    centered_precedence(opponent).at(2)
  end

  def centered_precedence(shape)
    distance_from_center = (PRECEDENCE.index(shape) + 1) - 2
    PRECEDENCE.rotate(distance_from_center)
  end
end
