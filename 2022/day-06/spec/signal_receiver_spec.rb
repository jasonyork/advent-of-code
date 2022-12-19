require_relative '../../spec/spec_helper'
require_relative '../signal_receiver'

RSpec.describe SignalReceiver do
  describe ".start_of_packet_pos" do
    let(:datastream) { "bvwbjplbgvbhsrlpgdmjqwftvncz" }
    subject { SignalReceiver.start_of_packet_pos(datastream:) }

    it { is_expected.to eq(5) }
  end

  describe ".start_of_message_pos" do
    let(:datastream) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }
    subject { SignalReceiver.start_of_message_pos(datastream:) }

    it { is_expected.to eq(19) }
  end
end
