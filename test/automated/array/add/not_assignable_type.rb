require_relative '../../automated_init'

context "Array" do
  context "Add" do
    context "Not Assignable Type" do
      collection = Collection::Array.new(String)

      test "Is an error (ArgumentError)" do
        assert_raises(ArgumentError) do
          collection.add(:not_a_string)
        end
      end
    end
  end
end
