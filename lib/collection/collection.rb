module Collection
  def self.included(cls)
    cls.include Enumerable
    cls.extend Generic
  end

  attr_reader :type_parameter

  def initialize(type_parameter)
    @type_parameter = type_parameter
  end

  def add(val)
    if not val.is_a?(type_parameter)
      raise ArgumentError, "#{val.inspect} must be a #{type_parameter.name}"
    end

    content.add(val)

    self
  end
  alias :<< :add

  def each(&action)
    content.each(&action)
  end

  def empty?
    content.empty?
  end

  def clear
    content.clear
    self
  end

  def ==(other)
    other.class == self.class && other.type_parameter == self.type_parameter && other.content == self.content
  end
  alias :eql? :==

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
