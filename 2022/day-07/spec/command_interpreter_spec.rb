require_relative '../../spec/spec_helper'
require_relative '../command_interpreter'
require_relative '../file_system'

RSpec.describe CommandInterpreter do
  let(:file_system) { FileSystem.new }
  subject { CommandInterpreter.new(file_system:) }

  describe "#process" do
    it "ignores unknown commands" do
      expect { subject.process(commands: ["$ foo"]) }.to_not raise_exception
    end

    it "changes the current working directory (cwd) to root" do
      subject.process(commands: ["$ cd /"])
      expect(subject.cwd).to eq([:/])
      expect(file_system[:/]).to eq({})
    end

    it "changes the current working directory (cwd)" do
      subject.process(commands: ["$ cd foo"])
      expect(subject.cwd).to eq([:foo])
    end

    it "adds a directory" do
      subject.process(commands: ["$ cd /", "dir foo"])
      expect(file_system[:/]).to eq({ foo: {} })
    end

    it "adds a file" do
      subject.process(commands: ["$ cd /", "123 foo.txt"])
      expect(file_system[:/]).to eq({ "foo.txt" => 123 })
    end

    it "navigates down a directory" do
      subject.process(commands: ["$ cd /", "dir foo", "$ cd foo"])
      expect(subject.cwd).to eq([:/, :foo])
    end

    it "navigates down and up an directory" do
      subject.process(commands: ["$ cd /", "dir foo", "$ cd foo", "$ cd .."])
      expect(subject.cwd).to eq([:/])
    end

    context "with sample data" do
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

      it "processes without error" do
        expect { subject.process(commands:) }.to_not raise_exception
      end
    end
  end
end
