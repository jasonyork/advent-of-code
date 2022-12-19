class SignalReceiver
  MARKER_LEN = 4
  MESSAGE_LEN = 14

  def self.start_of_uniq_sequence(datastream:, length:)
    datastream.chars.each_cons(length).with_index do |marker, index|
      return (index + length) if chars_unique?(marker)
    end
  end

  def self.start_of_packet_pos(datastream:)
    start_of_uniq_sequence(datastream:, length: MARKER_LEN)
  end

  def self.start_of_message_pos(datastream:)
    start_of_uniq_sequence(datastream:, length: MESSAGE_LEN)
  end

  def self.chars_unique?(marker)
    return false if marker.nil?
    marker.uniq == marker
  end
end
