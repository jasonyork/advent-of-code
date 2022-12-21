require_relative '../../spec/spec_helper'
require_relative '../command_interpreter'
require_relative '../file_system'

RSpec.describe FileSystem do
  subject { FileSystem.new }

  describe "#dir_sizes" do
    context "with a simple dir structure" do
      before { subject[:/] = { "a" => 1, "b" => 2, c: { "d" => 3, "e" => 4, f: { "g" => 5 } }, "h" => 6 } }
      its(:dir_sizes) { is_expected.to eq({ "/" => 21, "/c" => 12, "/c/f" => 5 }) }
    end
  end

  describe "#sum_of_dirs_with_max_size" do
    context "with supplied sample commands" do
      let(:file_system) { FileSystem.new }
      let(:command_interpreter) { CommandInterpreter.new(file_system:)}
      let(:commands) do
        ["$ cd /",
         "$ ls",
         "dir a",
         "14848514 b.txt",
         "8504156 c.dat",
         "dir d",
         "$ cd a",
         "$ ls",
         "dir e",
         "29116 f",
         "2557 g",
         "62596 h.lst",
         "$ cd e",
         "$ ls",
         "584 i",
         "$ cd ..",
         "$ cd ..",
         "$ cd d",
         "$ ls",
         "4060174 j",
         "8033020 d.log",
         "5626152 d.ext",
         "7214296 k" ]
      end
      let(:max_size) { 100_000 }

      subject { file_system.sum_of_dirs_with_max_size(max_size:) }
      before { command_interpreter.process(commands:) }

      it { is_expected.to eq(95437) }
    end
  end
end
