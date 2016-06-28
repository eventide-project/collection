require_relative '../automated_init'

context "Collection" do
  context "Detection" do
    context "Predicate" do
      context "Member is in the collection" do
        collection = Collection::Set.new(String)

        collection.add('thing')

        found = collection.entry? { |m| m == 'thing' }

        test "Member is found" do
          assert(found)
        end
      end

      context "Member is not in the collection" do
        collection = Collection::Set.new(String)

        found = collection.entry? { |m| m == 'thing' }

        test "Member is not found" do
          refute(found)
        end
      end
    end
  end
end
