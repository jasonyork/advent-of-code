class CalorieCounting
  attr_accessor :calorie_packs

  def initialize(calorie_packs:)
    @calorie_packs = calorie_packs
  end

  def most_calories
    calorie_packs.map(&:sum).max
  end

  def top_three
    calorie_packs.map(&:sum).sort.last(3).sum
  end
end
