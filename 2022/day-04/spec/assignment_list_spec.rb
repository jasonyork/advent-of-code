require_relative '../../spec/spec_helper'
require_relative '../assignment_list'

RSpec.describe AssignmentList do
  let(:assignments) do
    [[(2..4), (6..8)],
     [(2..3), (4..5)],
     [(5..7), (7..9)],
     [(2..8), (3..7)],
     [(6..6), (4..6)],
     [(2..6), (4..8)]]
  end
  subject { AssignmentList.new(assignments) }

  its(:covered_pairs) { is_expected.to eq([[2..8, 3..7], [6..6, 4..6]]) }
  its(:overlapping_pairs) { is_expected.to eq([[5..7, 7..9], [2..8, 3..7], [6..6, 4..6], [2..6, 4..8]]) }

  describe ".from_text" do
    let(:text) { %w[94-97,31-95 7-8,11-95 25-96,3-96] }
    subject { AssignmentList.from_text(text) }

    its(:first) { is_expected.to eq([94..97, 31..95]) }
    its(:last) { is_expected.to eq([25..96, 3..96]) }
  end
end
