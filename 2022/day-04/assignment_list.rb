class AssignmentList < Array
  def covered_pairs
    find_all { |pair| pair.first.cover?(pair.last) || pair.last.cover?(pair.first) }
  end

  def overlapping_pairs
    find_all { |pair| pair.first.to_a.intersect?(pair.last.to_a) }
  end

  def self.from_text(input)
    result = input.map { |line| line.split(",").map { |assignment| assignment_to_range(assignment) } }
    new(result)
  end

  def self.assignment_to_range(assignment)
    start, finish = assignment.split("-")
    Range.new(start.to_i, finish.to_i)
  end
end
