require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Nested Namespace Type Parameter" do
        type_parameter = Controls::Member::Class.example
        collection_class = Collection::Array[type_parameter]

        instance = collection_class.new

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Instance Type Parameter: #{instance.type_parameter.inspect}"
        comment "Collection Class: #{collection_class.inspect}"

        test "The index value is the collection's type parameter" do
          assert(instance.type_parameter == type_parameter)
        end

        context "Class Name" do
          type_parameter_name = type_parameter.name.gsub('::', '_')

          test "Derived from the type parameter's class" do
            assert(collection_class.name == "Collection::Array::#{type_parameter_name}")
          end
        end
      end
    end
  end
end