require_relative '../../automated_init'

context "Array" do
  context "Add" do
    context "Result" do
      collection = Collection::Array.new(String)

      result = collection.add('something')

      test "Self" do
        assert(result == collection)
      end
    end
  end
end
