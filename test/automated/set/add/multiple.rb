require_relative '../../automated_init'

context "Set" do
  context "Add" do
    context "List" do
      set = Collection::Set.new(String)

      members = ['something', 'something else']

      set.add(members)

      test "All members are added" do
        assert(set.to_a == members)
      end
    end
  end
end
