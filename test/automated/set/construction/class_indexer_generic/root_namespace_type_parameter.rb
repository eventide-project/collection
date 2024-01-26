require_relative '../../../automated_init'

context "Set" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Root Namespace Type Parameter" do
        type_parameter = Controls::Class::Root.example
        collection_class = Collection::Set[type_parameter]

        instance = collection_class.new

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Collection Type Parameter: #{instance.type_parameter.inspect}"
        comment "Collection Class: #{collection_class.inspect}"

        test "The index value is the collection's type parameter" do
          assert(instance.type_parameter == type_parameter)
        end

        _context "Class Name" do
          type_parameter_name = type_parameter.name.gsub('::', '_')

          test "Derived from the type parameter's class" do
            assert(collection_class.name == "Collection::Set::#{type_parameter_name}")
          end
        end

        context "Class Name" do
          context do
            control_type_parameter_name = type_parameter.name

            test "Is the type parameter name" do
              assert(collection_class.name.end_with?(control_type_parameter_name))
            end
          end

          context do
            control_namespace_name = "Collection::Set"

            test "Is in the Collection::Set namespace" do
              assert(collection_class.name.start_with?(control_namespace_name))
            end
          end
        end
      end
    end
  end
end
