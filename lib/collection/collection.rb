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

    items << val

    self
  end
  alias :<< :add

  def each(&action)
    items.each(&action)
  end

  def empty?
    items.empty?
  end

  def clear
    items.clear
    self
  end

  def ==(other)
    other.class == self.class && other.type_parameter == self.type_parameter && other.items == self.items
  end
  alias :eql? :==

  def self.Set(items, &implementation)
    items = Kernel::Array(items)

    raise ArgumentError, "Collection can't be empty" if items.empty?

    type_parameter = items[0].class

    cls = Set[type_parameter, &implementation]

    collection = cls.build(items)

    collection
  end

  def self.Array(items, &implementation)
    items = Kernel::Array(items)

    raise ArgumentError, "Collection can't be empty" if items.empty?

    type_parameter = items[0].class

    cls = Array[type_parameter, &implementation]

    collection = cls.build(items)

    collection
  end
end
