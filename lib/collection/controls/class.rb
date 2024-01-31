module Collection
  module Controls
    module Class
      def self.example
        Example
      end

      Example = ::Class.new

      module Random
        def self.example(root: nil)
          root ||= false

          class_name = "Class#{SecureRandom.hex(2).upcase}"

          namespace = namespace(root)

          namespace.const_set(class_name, ::Class.new)
        end

        def self.namespace(root)
          if root
            Object
          else
            Collection::Controls::Class
          end
        end
      end

      module Root
        def self.example
          Random.example(root: true)
        end
      end
    end
  end
end
