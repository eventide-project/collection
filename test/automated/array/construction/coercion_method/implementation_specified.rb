require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Coercion Method" do
      context "Implementation Specified" do
        array = Controls::Array::RandomMemberClass.example(homogeneous_classes: true)

        collection = Collection::Array(array) do
          def some_method
          end
        end

        comment "Type Parameter: #{collection.type_parameter.inspect}"
        comment "Class: #{collection.class.inspect}"

        context "Instance has Implementation" do
          test do
            refute_raises(NoMethodError) do
              collection.some_method
            end
          end
        end
      end
    end
  end
end
