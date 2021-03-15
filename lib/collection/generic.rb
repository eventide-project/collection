module Collection
  module Generic
    def [](type_parameter)
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

    def define_class(type_parameter)
      cls = Class.new(self) do
        def initialize; end

        define_method :type_parameter do
          type_parameter
        end
      end

      set_collection_constant(type_parameter, cls)

      cls
    end

    def constant_name(constant)
      constant.name.gsub('::', '_')
    end

    def set_collection_constant(constant, cls)
      class_name = constant_name(constant)

      unless self.const_defined?(class_name, false)
        self.const_set(class_name, cls)
      end

      class_name
    end
  end
end
