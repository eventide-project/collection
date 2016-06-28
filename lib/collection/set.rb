module Collection
  def self.[](type_parameter)
    Collection::Set[type_parameter]
  end

  class Set
    include Enumerable

    attr_reader :type_parameter

    def initialize(type_parameter)
      @type_parameter = type_parameter
    end

    def self.[](type_parameter)
      cls = Class.new(self) do
        def initialize; end

        define_method :type_parameter do
          type_parameter
        end
      end

      set_collection_constant(type_parameter, cls)

      cls
    end

    def self.set_collection_constant(constant, cls)
      class_name = constant.name.gsub('::', '_')

      unless const_defined?(class_name)
        self.const_set(class_name, cls)
      end

      class_name
    end

    def add(val)
      raise ArgumentError, "#{val.inspect} must be a #{type_parameter.name}" unless val.is_a? type_parameter
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
      @set ||= ::Set.new
    end
  end
end
