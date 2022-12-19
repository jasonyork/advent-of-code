class Rucksack
  attr_accessor :compartment_one, :compartment_two

  PRIORITIES = ('a'..'z').to_a + ('A'..'Z').to_a

  def initialize(contents:)
    half_length = contents.length / 2
    @compartment_one = contents[0, half_length].chars
    @compartment_two = contents[-half_length, half_length].chars
  end

  def item_in_both_compartments
    @compartment_one.intersection(@compartment_two).first
  end

  def self.priority_for(item)
    PRIORITIES.index(item) + 1
  end

  def priority_for(item)
    self.class.priority_for(item)
  end

  def priority_of_item_in_both_compartments
    priority_for(item_in_both_compartments)
  end

  def combined_contents
    @combined_contents ||= compartment_one + compartment_two
  end
end
