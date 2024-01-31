module Collection
  module Generic
    def [](type_parameter, &implementation)
      type_parameter_name = constant_name(type_parameter)

      if implementation.nil? && self.const_defined?(type_parameter_name, false)
        return const_get(type_parameter_name)
      else
        return define_class(type_parameter, &implementation)
      end
    end

    def define_class(type_parameter, &implementation)
      cls = Class.new(self) do
        def self.build(items)
          instance = new

          items.each do |member|
            instance.add(member)
          end

          instance
        end

        def initialize; end

        define_method :type_parameter do
          type_parameter
        end
      end

      if not implementation.nil?
        cls.class_exec(&implementation)
      end

      randomize = !implementation.nil?
      set_collection_constant(type_parameter, cls, randomize)

      cls
    end

    def set_collection_constant(constant, cls, randomize=nil)
      randomize ||= false

      constant_name = constant_name(constant)

      if randomize
        suffix = SecureRandom.hex.upcase
        constant_name = "#{constant_name}_#{suffix}"
      end

      self.const_set(constant_name, cls)

      constant_name
    end

    def constant_name(constant)
      constant.name.gsub('::', '_')
    end
  end
end
