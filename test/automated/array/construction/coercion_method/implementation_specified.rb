require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Coercion Method" do
      context "Implementation Specified" do
        array = Controls::Array::RandomMemberClass.example

        collection = Collection::Array(array) do
          def some_method
            :some_value
          end
        end

        comment "Type Parameter: #{collection.type_parameter.inspect}"
        comment "Class: #{collection.class.inspect}"

        context "Implementation" do
          result = collection.some_method

          test do
            assert(result == :some_value)
          end
        end
      end
    end
  end
end
