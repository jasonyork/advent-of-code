#!/usr/bin/env ruby

require_relative 'signal_receiver'

datastream = File.read('input.txt')
puts "Part 1 - solution: #{SignalReceiver.start_of_packet_pos(datastream:)}"
puts "Part 2 - solution: #{SignalReceiver.start_of_message_pos(datastream:)}"
