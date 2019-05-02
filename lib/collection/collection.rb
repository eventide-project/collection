module Collection
  def self.[](type_parameter)
    Set[type_parameter]
  end

  def self.Set(items)
    items = Array(items)

    raise ArgumentError, "Collection can't be empty" if items.empty?

    type_parameter = items[0].class

    set = Set[type_parameter].new

    items.each do |member|
      set.add member
    end

    set
  end
end
