require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Coercion Method" do
      context "From an Array" do
        array = Controls::Array.example

        collection = Collection::Array(array)

        collection_class = collection.class
        type_parameter = collection.type_parameter

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Collection Type Parameter: #{collection.type_parameter.inspect}"
        comment "Class: #{collection.class.inspect}"

        test "The first member's class is the collection's type parameter" do
          assert(type_parameter == array[0].class)
        end

        test "Collection content is the array it was constructed from" do
          assert(collection.to_a == array)
        end

        context "Class Name" do
          context do
            control_type_parameter_name = type_parameter.name.gsub('::', '_')

            test "Is the underscore-delimited type parameter name" do
              assert(collection_class.name.end_with?(control_type_parameter_name))
            end
          end

          context do
            control_namespace_name = "Collection::Array"

            test "Is in the Collection::Array namespace" do
              assert(collection_class.name.start_with?(control_namespace_name))
            end
          end
        end
      end

      context "From a Single Object" do
        member = Controls::Class.example

        collection = Collection::Array(member)

        collection_class = collection.class
        type_parameter = collection.type_parameter

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Collection Type Parameter: #{collection.type_parameter.inspect}"
        comment "Class: #{collection.class.inspect}"

        test "The object's class is the collection's type parameter" do
          assert(type_parameter == member.class)
        end

        test "Collection content is the object it was constructed from" do
          assert(collection.to_a == [member])
        end

        context "Class Name" do
          context do
            control_type_parameter_name = type_parameter.name.gsub('::', '_')

            test "Is the underscore-delimited type parameter name" do
              assert(collection_class.name.end_with?(control_type_parameter_name))
            end
          end

          context do
            control_namespace_name = "Collection::Array"

            test "Is in the Collection::Array namespace" do
              assert(collection_class.name.start_with?(control_namespace_name))
            end
          end
        end
      end

      context "From an array of elements of different classes" do
        array = Controls::Array::RandomMemberClass.example(homogeneous_classes: false)

        test "Is an error" do
          assert_raises(ArgumentError) do
            Collection::Array(array)
          end
        end
      end
    end
  end
end
