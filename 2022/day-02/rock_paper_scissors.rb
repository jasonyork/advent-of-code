class RockPaperScissors
  attr_accessor :rounds

  PRECEDENCE = [:rock, :scissors, :paper]

  def initialize(rounds:)
    @rounds = rounds
  end

  def total_score
    rounds.sum { |round| score_for(round) }
  end

  def score_for(round)
    opponent, player = round
    shape_score(player) + round_score(outcome_for(player, opponent))
  end

  def shape_score(shape)
    { rock: 1, paper: 2, scissors: 3 }[shape]
  end

  def round_score(outcome)
    { win: 6, draw: 3, loss: 0 }[outcome]
  end

  def outcome_for(player, opponent)
    precedence = centered_precedence(player)
    diff = precedence.index(opponent) - precedence.index(player)
    return :draw if diff == 0
    return :win if diff > 0

    :loss
  end

  def centered_precedence(shape)
    distance_from_center = (PRECEDENCE.index(shape) + 1) - 2
    PRECEDENCE.rotate(distance_from_center)
  end
end
