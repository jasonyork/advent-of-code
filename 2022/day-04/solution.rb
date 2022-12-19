#!/usr/bin/env ruby

require_relative 'assignment_list'

assignment_list = AssignmentList.from_text(File.readlines('input.txt'))
puts "Part 1 - solution: #{assignment_list.covered_pairs.count}"
puts "Part 2 - solution: #{assignment_list.overlapping_pairs.count}"
