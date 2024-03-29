require_relative '../../automated_init'

context "Set" do
  context "Add" do
    context "Single" do
      collection = Collection::Set.new(String)

      context "Member is an Assignable Type" do
        collection.add('something')

        test "Member can be detected in the collection" do
          assert(collection.any? { |m| m == 'something' })
        end
      end
    end
  end
end
