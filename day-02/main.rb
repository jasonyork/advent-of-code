#!/usr/bin/env ruby

require_relative 'rock_paper_scissors'
require_relative 'strategy_guide'
require_relative 'decrypted_strategy_guide'

symbols = File.readlines('input.txt').map { |line| line.split(" ") }

strategy_guide = StrategyGuide.new(symbols:)

puts "Part 1 - total score: #{RockPaperScissors.new(rounds: strategy_guide.rounds).total_score}"

decrypted_strategy_guide = DecryptedStrategyGuide.new(symbols:)
puts "Part 2 - total score: #{RockPaperScissors.new(rounds: decrypted_strategy_guide.rounds).total_score}"
