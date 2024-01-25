module Collection
  module Generic
    def [](type_parameter, &implementation)
      need_unique_class_name = !implementation.nil?
      type_parameter_name = constant_name(type_parameter, need_unique_class_name)

      cls = nil
      unless self.const_defined?(type_parameter_name, false)
        cls = define_class(type_parameter, &implementation)
        set_collection_constant(type_parameter, cls)
      else
        cls = const_get(type_parameter_name)
      end

      cls
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

      set_collection_constant(type_parameter, cls)

      cls
    end

    def constant_name(constant, unique_class_name=nil)
      unique_class_name ||= false

      constant_name = name.gsub('::', '_')

      if unique_class_name
        constant_name
      else
        "#{constant_name}#{SecureRandom.hex.upcase}"
      end
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
