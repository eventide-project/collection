module Collection
  class Set
    include Enumerable

    attr_reader :type_parameter

    def initialize(type_parameter)
      @type_parameter = type_parameter
    end

    def self.[](type_parameter)
      type_parameter_name = constant_name(type_parameter)

      cls = nil
      unless self.const_defined?(type_parameter_name, false)
        cls = define_class(type_parameter)
        set_collection_constant(type_parameter, cls)
      else
        cls = const_get(type_parameter_name)
      end

      cls
    end

    def self.define_class(type_parameter)
      cls = Class.new(self) do
        def initialize; end

        define_method :type_parameter do
          type_parameter
        end
      end

      set_collection_constant(type_parameter, cls)

      cls
    end

    def self.constant_name(constant)
      constant.name.gsub('::', '_')
    end

    def self.set_collection_constant(constant, cls)
      class_name = constant_name(constant)

      unless self.const_defined?(class_name, false)
        self.const_set(class_name, cls)
      end

      class_name
    end

    def ==(other)
      other.class == self.class && other.type_parameter == self.type_parameter && other.content == self.content
    end
    alias :eql? :==

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

    def length
      content.length
    end
    alias :size :length

    def clear
      content.clear
      self
    end

    def content
      @content ||= ::Set.new
    end
  end
end
