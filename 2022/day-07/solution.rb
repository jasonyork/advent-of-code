#!/usr/bin/env ruby

require_relative 'command_interpreter'
require_relative 'file_system'

commands = File.readlines('input.txt')
file_system = FileSystem.new
CommandInterpreter.new(file_system:).process(commands:)
dir_sizes = file_system.dir_sizes

MAX_SIZE = 100_000
puts "Part 1 - solution: #{file_system.sum_of_dirs_with_max_size(max_size: MAX_SIZE)}"

FILE_SYSTEM_SPACE = 70_000_000
REQUIRED_SPACE = 30_000_000

total_used_space = dir_sizes["/"]

total_unused_space = FILE_SYSTEM_SPACE - total_used_space
min_space_to_free = REQUIRED_SPACE - total_unused_space

size_of_dir_to_delete = dir_sizes.values.sort.find { |size| size > min_space_to_free }

puts "Part 2 - solution: #{size_of_dir_to_delete}"
