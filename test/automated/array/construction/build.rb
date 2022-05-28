require_relative '../../automated_init'

context "Array" do
  context "Construction" do
    context "Build" do
      context "From an Array" do
        array = Controls::Array.example

        collection = Collection::Array[Controls::Array::Member].build(array)

        test "Constructs the instance" do
          refute(collection.nil?)
        end

        test "Collection contents is the array it was constructed from" do
          assert(collection.to_a == array)
        end
      end

      context "From an array of varied types" do
        array = Controls::Array::Anomaly.example

        test "Is an error" do
          assert_raises(ArgumentError) do
            collection = Collection::Array[Controls::Array::Member].build(array)
          end
        end
      end
    end
  end
end
