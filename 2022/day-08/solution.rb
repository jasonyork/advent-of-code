#!/usr/bin/env ruby

require_relative 'tree_map'

lines = File.readlines('input.txt')
tree_map = TreeMap.from_lines(lines)

puts "Part 1 - solution: #{tree_map.visible_count}"
puts "Part 2 - solution: #{tree_map.highest_visibility_score}"
