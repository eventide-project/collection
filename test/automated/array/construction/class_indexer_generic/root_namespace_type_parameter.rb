require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Root Namespace Type Parameter" do
        type_parameter = Controls::Member::Root.example
        collection_class = Collection::Array[type_parameter]

        instance = collection_class.new

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Instance Type Parameter: #{instance.type_parameter.inspect}"
        comment "Collection Class: #{collection_class.inspect}"

        test "The index value is the collection's type parameter" do
          assert(instance.type_parameter == type_parameter)
        end

        context "Class Name" do
          control_type_parameter_name = type_parameter.name.gsub('::', '_')
          control_class_name = "Collection::Array::#{control_type_parameter_name}"

          class_name = collection_class.name

          comment class_name.inspect
          detail "Control: #{control_class_name.inspect}"

          test "Derived from the type parameter's class" do
            assert(collection_class.name == "Collection::Array::#{control_type_parameter_name}")
          end
        end
      end
    end
  end
end
