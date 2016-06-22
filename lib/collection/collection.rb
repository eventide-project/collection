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

  def add_unless(val, &predicate)
    raise ArgumentError, "Predicate must be supplied" unless block_given?

    member = entry(&predicate)

    if member.nil?
      member ||= val
      add(member)
    end

    member
  end

  def entry?(val=nil, &predicate)
    if !block_given?
      predicate = lambda { |m| m == val }
    end

    entries(&predicate).length > 0
  end

  def entries(&predicate)
    set.select(&predicate)
  end

  def entry(&predicate)
    set.find(&predicate)
  end

  def each(&action)
    set.each(&action)
  end

  def entries?
    !set.empty?
  end

  def empty?
    set.empty?
  end

  private def set
    @set ||= Set.new
  end
end
