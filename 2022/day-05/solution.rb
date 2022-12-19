#!/usr/bin/env ruby

require_relative 'cargo_crane_9000'
require_relative 'cargo_crane_9001'
require_relative 'instruction'

stacks = [
  %w[P L M N W V B H],
  %w[H Q M],
  %w[L M Q F G B D N],
  %w[G W M Q F T Z],
  %w[P H T M],
  %w[T G H D J M B C],
  %w[R V F B N M],
  %w[S G R M H L P],
  %w[N C B D P]
]

instructions = File.readlines('instructions.txt').map { |line| Instruction.from_text(text: line.strip) }

cargo_crane = CargoCrane9000.new(stacks: stacks)
cargo_crane.move(instructions:)
puts "Part 1 - solution: #{cargo_crane.stacks.map(&:first).join}"

cargo_crane = CargoCrane9001.new(stacks: stacks)
cargo_crane.move(instructions:)
puts "Part 2 - solution: #{cargo_crane.stacks.map(&:first).join}"

