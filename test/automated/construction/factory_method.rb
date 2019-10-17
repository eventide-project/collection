require_relative '../automated_init'

context "Collection" do
  context "Construction" do
    context "Factory Method" do
      context "From an Array" do
        array = Controls::Array.example

        set = Collection::Set(array)

        test "Constructs the instance" do
          refute(set.nil?)
        end

        test "The first member's class is the set's class parameter" do
          assert(set.type_parameter == array[0].class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(set.class.name == "Collection::Set::Collection_Controls_Array_Member")
        end

        test "Collection contents is the array it was constructed from" do
          assert(set.to_a == array)
        end
      end

      context "From a Single Object" do
        member = Controls::Member.example

        set = Collection::Set(member)

        test "Constructs the instance" do
          refute(set.nil?)
        end

        test "The object's class is the set's class parameter" do
          assert(set.type_parameter == member.class)
        end

        test "The class's name is derived from the type parameter's class" do
          assert(set.class.name == "Collection::Set::Collection_Controls_Member_Member")
        end

        test "Collection contents is the object it was constructed from" do
          assert(set.to_a == [member])
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
