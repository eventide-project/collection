require_relative '../../automated_init'

context "Array" do
  context "Equality" do
    context "Equal" do
      context "Entries Are Equal" do
        collection = Collection::Array.new(String)
        other_collection = Collection::Array.new(String)

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
