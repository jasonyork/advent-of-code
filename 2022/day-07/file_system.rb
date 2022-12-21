class FileSystem < Hash

  def initialize
    super
    self[:/] = {}
    @dir_sizes = {}
  end

  def dir_sizes
    return @dir_sizes unless @dir_sizes.empty?

    dir_size(cwd: [:/])
    @dir_sizes
  end

  def dir_size(cwd:)
    @dir_sizes["/" + cwd.slice(1..).join('/')] = self.dig(*cwd).sum { |k, v| is_dir?(item: k) ? dir_size(cwd: cwd.clone.push(k)) : v }
  end

  def is_dir?(item:)
    item.is_a?(Symbol)
  end

  def sum_of_dirs_with_max_size(max_size:)
    dir_sizes.values.sum { |size| size <= max_size ? size : 0 }
  end
end
