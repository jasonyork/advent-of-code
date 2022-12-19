#!/usr/bin/env ruby
#
require_relative 'rucksack'
require_relative 'rucksack_collection'

rucksacks = File.readlines('sample-input.txt').map { |line| Rucksack.new(contents: line.strip) }
puts "Part 1 - sample input: #{rucksacks.map(&:priority_of_item_in_both_compartments).sum}"

rucksacks = File.readlines('input.txt').map { |line| Rucksack.new(contents: line.strip) }
puts "Part 1 - solution: #{rucksacks.map(&:priority_of_item_in_both_compartments).sum}"

badge_priority = rucksacks.each_slice(3).map { |sacks| RucksackCollection.new(sacks) }.sum(&:priority_of_common_item)
puts "Part 2 - solution: #{badge_priority}"
