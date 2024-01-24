require_relative '../../automated_init'

context "Set" do
  context "Construction" do
    context "Build" do
      context "From an Array" do
        array = Controls::Array.example

        member_class = array[0].class

        collection = Collection::Set[member_class].build(array)

        test "Constructs the instance" do
          refute(collection.nil?)
        end

        test "Collection contents is the array it was constructed from" do
          assert(collection.to_a == array)
        end
      end

      context "From an array of varied types" do
        array = Controls::Array::Anomaly.example

        member_class = array[0].class

        test "Is an error" do
          assert_raises(ArgumentError) do
            collection = Collection::Set[member_class].build(array)
          end
        end
      end
    end
  end
end
