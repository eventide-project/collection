module Collection
  module Controls
    module Array
      def self.example
        [member_class.new, member_class.new]
      end

      def self.member_class
        Class.example
      end

      module RandomMemberClass
        def self.example(homogeneous_types: nil)
          homogeneous_types ||= false

          if homogeneous_types
            cls_1 = member_class
            cls_2 = cls_1
          else
            cls_1 = member_class
            cls_2 = member_class
          end

          [cls_1.new, cls_2.new]
        end

        def self.member_class
          Class::Random.example
        end
      end

## Replace with random
      module Anomaly
        def self.example
          [member_class.new, member_class.new]
        end

        def self.member_class
          Class::Random.example
        end
      end
    end
  end
end
