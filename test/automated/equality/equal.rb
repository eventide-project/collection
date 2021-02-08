require_relative '../automated_init'

context "Collection" do
  context "Equality" do
    context "Collections Are Equal" do
      collection = Collection::Set.new(String)
      other_collection = Collection::Set.new(String)

      collection.add('something')
      other_collection.add('something')

      equal = collection.eql?(other_collection)

      test "Is equal" do
        assert(equal)
      end
    end
  end
end
