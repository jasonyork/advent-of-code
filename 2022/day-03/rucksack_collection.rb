class RucksackCollection < Array

  def common_item
    reduce(first.combined_contents) do |in_all, sack|
      sack.combined_contents.intersection(in_all)
    end.first
  end

  def priority_of_common_item
    Rucksack.priority_for(common_item)
  end
end
