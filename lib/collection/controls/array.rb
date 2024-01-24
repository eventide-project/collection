module Collection
  module Controls
    module Array
      def self.example
        [member_class.new, member_class.new]
      end

      def self.member_class
        Member::Class.example
      end

      module RandomMemberClass
        def self.example
          cls = member_class
          [cls.new, cls.new]
        end

        def self.member_class
          Member::Class.random
        end
      end

      module Anomaly
        def self.example
          [member_class.new, member_class.new]
        end

        def self.member_class
          Member::Class.random
        end
      end
    end
  end
end
