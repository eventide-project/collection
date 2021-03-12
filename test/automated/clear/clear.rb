require_relative '../automated_init'

context "Collection" do
  context "Clear Members" do
    members = Controls::Array.example
    collection = Collection.Set(members)

    refute(collection.empty?)

    result = collection.clear

    context "Result" do
      comment result

      test "The set" do
        assert(result == collection)
      end
    end

    context "Members" do
      test "Are empty" do
        assert(collection.empty?)
      end
    end
  end
end
