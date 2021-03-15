require_relative '../../automated_init'

context "Set" do
  context "Add" do
    context "Result" do
      set = Collection::Set.new(String)

      result = set.add('something')

      test "Self" do
        assert(result == set)
      end
    end
  end
end
