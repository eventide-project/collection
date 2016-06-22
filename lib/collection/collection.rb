class Collection
  attr_reader :cls

  def initialize(cls)
    @cls = cls
  end

  def self.[](cls)
    new(cls)
  end

  def add(val)
    raise ArgumentError, "#{val.inspect} must be a #{cls.name}" unless val.is_a? cls
    set.add(val)
  end
  alias :<< :add

  def member?(&predicate)
    members(&predicate).length == 1
  end

  def members?(&predicate)
    if !block_given?
      predicate = lamda { |_| true }
    end

    members(&predicate).length > 0
  end

  def members(&predicate)
    set.select(&predicate)
  end

  def each(&action)
    set.each(&action)
  end

  def empty?
    set.empty?
  end

  private def set
    @set ||= Set.new
  end
end
