require_relative '../../automated_init'

context "Set" do
  context "Add" do
    context "Result" do
      collection = Collection::Set.new(String)

      result = collection.add('something')

      test "Self" do
        assert(result == collection)
      end
    end
  end
end
