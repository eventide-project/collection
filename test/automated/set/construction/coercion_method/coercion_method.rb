require_relative '../../../automated_init'

context "Set" do
  context "Construction" do
    context "Coercion Method" do
      context "From an Array" do
        array = Controls::Array.example

        collection = Collection::Set(array)

        collection_class = collection.class
        type_parameter = collection.type_parameter

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Collection Type Parameter: #{collection.type_parameter.inspect}"
        comment "Class: #{collection.class.inspect}"

        test "The first member's class is the collection's type parameter" do
          assert(type_parameter == array[0].class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(collection.class.name == "Collection::Set::Collection_Controls_Member_Class_Member")
        end

        test "Collection content is the array it was constructed from" do
          assert(collection.to_a == array)
        end
      end

      context "From a Single Object" do
        member = Controls::Member.example

        collection = Collection::Set(member)

        collection_class = collection.class
        type_parameter = collection.type_parameter

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Collection Type Parameter: #{collection.type_parameter.inspect}"
        comment "Class: #{collection.class.inspect}"

        test "The object's class is the collection's type parameter" do
          assert(type_parameter == member.class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(collection.class.name == "Collection::Set::Collection_Controls_Member_Class_Member")
        end

        test "Collection content is the object it was constructed from" do
          assert(collection.to_a == [member])
        end
      end

      context "From an array of varied types" do
        array = Controls::Array::Anomaly.example

        test "Is an error" do
          assert_raises(ArgumentError) do
            Collection::Set(array)
          end
        end
      end
    end
  end
end
