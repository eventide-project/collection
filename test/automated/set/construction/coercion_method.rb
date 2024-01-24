require_relative '../../automated_init'

context "Set" do
  context "Construction" do
    context "Coercion Method" do
      context "From an Array" do
        array = Controls::Array.example

        collection = Collection::Set(array)

        test "The first member's class is the collection's class parameter" do
          assert(collection.type_parameter == array[0].class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(collection.class.name == "Collection::Set::Collection_Controls_Array_Member")
        end

        test "Collection contents is the array it was constructed from" do
          assert(collection.to_a == array)
        end
      end

      context "From a Single Object" do
        member = Controls::Member.example

        collection = Collection::Set(member)

        test "The object's class is the collection's class parameter" do
          assert(collection.type_parameter == member.class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(collection.class.name == "Collection::Set::Collection_Controls_Member_Member")
        end

        test "Collection contents is the object it was constructed from" do
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
