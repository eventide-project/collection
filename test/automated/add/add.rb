require_relative '../automated_init'

context "Collection" do
  context "Add a Member" do
    collection = Collection::Set.new(String)

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

  context "An Array of Members" do
    set = Collection::Set.new(String)

    members = ['something', 'something else']

    set.add(members)

    test "All members are added" do
      assert(set.to_a == members)
    end
  end

  context "Result" do
    set = Collection::Set.new(String)

    result = set.add('something')

    test "The set" do
      assert(result == set)
    end
  end
end
