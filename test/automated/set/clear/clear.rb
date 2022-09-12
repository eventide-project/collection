require_relative '../../automated_init'

context "Set" do
  context "Clear Members" do
    members = Controls::Array.example
    collection = Collection::Set(members)

    refute(collection.empty?)

    result = collection.clear

    context "Members" do
      test "Are removed" do
        assert(collection.empty?)
      end
    end

    context "Result" do
      test "The set" do
        assert(result == collection)
      end
    end
  end
end
