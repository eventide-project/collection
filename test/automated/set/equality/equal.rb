require_relative '../../automated_init'

context "Set" do
  context "Equality" do
    context "Equal" do
      context "Entries Are Equal" do
        collection = Collection::Set.new(String)
        other_collection = Collection::Set.new(String)

        collection.add('something')
        other_collection.add('something')

        equal = collection.eql?(other_collection)

        test do
          assert(equal)
        end
      end
    end
  end
end
