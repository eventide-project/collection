require_relative '../../../../automated_init'

context "Array" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Implementation Specified" do
        context "Classes with the Same Type Parameter and with an Implementation" do
          type_parameter = Controls::Class.example

          cls_1 = Collection::Array[type_parameter] do
            def some_method
            end
          end

          cls_2 = Collection::Array[type_parameter] do
            def some_method
            end
          end

          comment "Type Parameter: #{type_parameter.inspect}"
          comment "Collection Class 1: #{cls_1.inspect}"
          comment "Collection Class 2: #{cls_2.inspect}"

          context do
            test "Are unique classes" do
              refute(cls_1 == cls_2)
            end
          end

          context "Class Name" do
            control_namespace_name = "Collection::Array"
            control_type_parameter_name = type_parameter.name.gsub('::', '_')
            control_class_name_prefix = "#{control_namespace_name}::#{control_type_parameter_name}"

            class_name = cls_1.name

            test "Is in the Collection::Array namespace" do
              assert(class_name.start_with?(control_namespace_name))
            end

            test "Contains the underscore-delimited type parameter name" do
              assert(class_name.include?(control_type_parameter_name))
            end

            context "Random Suffix" do
              assert(class_name.start_with?(control_class_name_prefix))

              test "Assigned to the collection class" do
                assert(class_name.length > control_class_name_prefix.length)
              end
            end
          end
        end
      end
    end
  end
end
