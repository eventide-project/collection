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
    end
  end
end
