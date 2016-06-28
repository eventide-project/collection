require_relative '../automated_init'

context "Collection" do
  context "Adding a Member Unless (Condition)" do
    context "Condition is Met" do
      collection = Collection::Set.new(String)
      collection.add('something')

      collection.add_unless('something else') do |m|
        m == 'something'
      end

      test "Not added" do
        refute(collection.entry? { |m| m == 'something else' })
      end
    end

    context "Condition is not met" do
      collection = Collection::Set.new(String)

      collection.add_unless('something else') do |m|
        m == 'something'
      end

      test "Added" do
        assert(collection.entry? { |m| m == 'something else' })
      end
    end
  end
end
