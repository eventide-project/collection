require_relative 'automated_init'

context "Collection" do
  context "Construction" do
    collection = Collection[String].new

    context "By class indexer" do
      test "Constructs the instance" do
        refute(collection.nil?)
      end

      test "The index value is the collection's class parameter" do
        assert(collection.type_parameter == String)
      end
    end
  end
end
