require_relative '../../automated_init'

context "Array" do
  context "Construction" do
    context "Factory Method" do
      context "From an Array" do
        array = Controls::Array.example

        collection = Collection::Array(array)

        test "Constructs the instance" do
          refute(collection.nil?)
        end

        test "The first member's class is the collection's class parameter" do
          assert(collection.type_parameter == array[0].class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(collection.class.name == "Collection::Array::Collection_Controls_Array_Member")
        end

        test "Collection contents is the array it was constructed from" do
          assert(collection.to_a == array)
        end
      end

      context "From a Single Object" do
        member = Controls::Member.example

        collection = Collection::Array(member)

        test "Constructs the instance" do
          refute(collection.nil?)
        end

        test "The object's class is the collection's class parameter" do
          assert(collection.type_parameter == member.class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(collection.class.name == "Collection::Array::Collection_Controls_Member_Member")
        end

        test "Collection contents is the object it was constructed from" do
          assert(collection.to_a == [member])
        end
      end

      context "From an array of varied types" do
        array = Controls::Array::Anomaly.example

        test "Is an error" do
          assert_raises(ArgumentError) do
            Collection::Array(array)
          end
        end
      end
    end
  end
end
