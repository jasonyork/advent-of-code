require 'matrix'

class TreeMap < Matrix
  def self.from_lines(lines)
    rows(lines.each.map { |line| line.strip.chars.map(&:to_i) })
  end

  def visible_map
    from_left = self.class.rows(rows.map { |row| visible_in_row(row) })
    from_right =  self.class.rows(rows.map { |row| visible_in_row(row.reverse).reverse })
    from_top = self.class.columns(column_vectors.map { |row| visible_in_row(row.to_a) })
    from_bottom = self.class.columns(column_vectors.map { |row| visible_in_row(row.to_a.reverse).reverse })
    [from_right, from_top, from_bottom].reduce(from_left) do |result, direction|
      result.combine(direction) { |a, b| [a, b].max }
    end
  end

  def visible_in_row(row)
    tallest = -1
    row.map { |height| (height > tallest ? 1 : 0).tap { |result| tallest = height if result == 1 } }
  end

  def visible_count
    visible_map.sum
  end

  def visibility_score_map
    visibility_score_map = Matrix.scalar(row_count, 0)
    each_with_index do |elem, row, col|
      visibility_score_map[row, col] = visibility_score_from_point(row, col)
    end
    visibility_score_map
  end

  def visibility_score_from_point(row, col)
    height = self[row, col]
    looking_right = viewing_distance(row(row).to_a.slice(col+1...), height)
    looking_left = viewing_distance(row(row).to_a.slice(0...col).reverse, height)
    looking_down = viewing_distance(column(col).to_a.slice(row+1...), height)
    looking_up = viewing_distance(column(col).to_a.slice(0...row).reverse, height)
    looking_right * looking_left * looking_down * looking_up
  end

  def viewing_distance(row, at_height)
    return 0 if row.empty?

    index = row.find_index { |height| height >= at_height }
    index.nil? ? row.length : index + 1
  end

  def highest_visibility_score
    visibility_score_map.inject(0) { |highest_score, score| highest_score = [score, highest_score].max  }
  end
end
