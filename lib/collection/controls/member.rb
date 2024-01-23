module Collection
  module Controls
    module Member
      def self.example
        example_class.new
      end

      def self.example_class
        Member
      end

      class Member
      end

      module Root
        def self.example
          root_class_name = "Class#{SecureRandom.hex(2).upcase}"
          Object.const_set(root_class_name, Class.new)
        end
      end
    end
  end
end
