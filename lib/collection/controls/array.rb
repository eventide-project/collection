module Collection
  module Controls
    module Array
      def self.example
        [Member.new, Member.new]
      end

      class Member
      end

      module Anomaly
        def self.example
          [Array::Member.new, Member.new]
        end

        class Member
        end
      end
    end
  end
end
