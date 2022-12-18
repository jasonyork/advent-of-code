#!/usr/bin/env ruby

require_relative 'calorie_counting'

calorie_packs = []
pack = []

File.readlines('input.txt').each do |line|
  if line.strip.empty?
    calorie_packs << pack
    pack = []
    next
  end
  pack << line.to_i
end

puts "Part 1 - most calories: #{CalorieCounting.new(calorie_packs:).most_calories}"
puts "Part 2 - top three most calories: #{CalorieCounting.new(calorie_packs:).top_three}"

