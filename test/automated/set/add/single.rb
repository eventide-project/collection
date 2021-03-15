require_relative '../../automated_init'

context "Set" do
  context "Add" do
    context "Single" do
      collection = Collection::Set.new(String)

      context "Member is an Assignable Type" do
        collection.add('something')

        test "Member can be detected in the collection" do
          assert(collection.entry? { |m| m == 'something' })
        end
      end

      context "Member is Not Assignable Type" do
        test "Is an error (ArgumentError)" do
          assert_raises(ArgumentError) do
            collection.add(:not_a_string)
          end
        end
      end
    end
  end
end
