require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Root Namespace Type Parameter" do
        type_parameter = Controls::Member.example_class

        set_class = Collection::Array[type_parameter]

        test "The index value is the collection's class parameter" do
          assert(set_class.new.type_parameter == type_parameter)
        end

        context "Class Name" do
          type_parameter_name = type_parameter.name.gsub('::', '_')

          test "Derived from the type parameter's class" do
            assert(set_class.name == "Collection::Array::#{type_parameter_name}")
          end
        end
      end
    end
  end
end
