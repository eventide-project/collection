require_relative '../automated_init'

context "Collection" do
  context "Adding a Member" do
    collection = Collection.new(String)

    context "Member is an Assignable Type" do
      collection.add('something')

      test "Member can be detected in the collection" do
        assert(collection.entry? { |m| m == 'something' })
      end
    end

    context "Member is Not Assignable Type" do
      incorrect = proc { collection.add(:not_a_string) }

      test "Is an error (ArgumentError)" do
        assert(incorrect) do
          raises_error? ArgumentError
        end
      end
    end
  end
end
