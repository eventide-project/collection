require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Implementation Specified" do
        type_parameter = Controls::Member::Class.random

        cls = Collection::Array[type_parameter] do
          def some_method
            :some_value
          end
        end

        instance = cls.new

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Instance Type Parameter: #{instance.type_parameter.inspect}"
        comment "Class: #{cls.inspect}"

        context "Implementation" do
          result = instance.some_method

          test do
            assert(result == :some_value)
          end
        end
      end
    end
  end
end
