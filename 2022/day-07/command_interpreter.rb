class CommandInterpreter
  attr_accessor :file_system, :cwd

  MATCHERS = {
    cd: /\$ cd (?<dir>[\w|\/]+)/,
    cd_up: /\$ cd ../,
    dir: /dir (?<name>\w+)/,
    file: /(?<size>\d+) (?<name>[\w|.]+)/
  }

  def initialize(file_system:)
    @file_system = file_system
    @cwd = []
  end

  def process(commands:)
    commands.each do |command|
      method, _regex = MATCHERS.find { |_method, matcher| command.match(matcher) }
      invoke_command(method, Regexp.last_match) unless method.nil?
    end
  end

  def invoke_command(method, match_data)
    send(method, **match_data.named_captures.transform_keys(&:to_sym))
  end

  def cd(dir:)
    cwd.push(dir.to_sym)
  end

  def cd_up
    cwd.pop
  end

  def dir(name:)
    file_system.dig(*cwd)[name.to_sym] = {}
  end

  def file(name:, size:)
    file_system.dig(*cwd)[name] = size.to_i
  end
end
