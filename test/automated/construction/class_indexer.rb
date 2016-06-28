require_relative '../automated_init'

context "Collection" do
  context "Construction" do
    collection = Collection[Controls::Member.example_class].new

    context "Class Indexer" do
      test "Constructs the instance" do
        refute(collection.nil?)
      end

      test "The index value is the collection's class parameter" do
        assert(collection.type_parameter == Controls::Member.example_class)
      end

      test "The class's name is derived from the type parameter's class" do
        assert(collection.class.name == "Collection::Set::Collection_Controls_Member_Member")
      end
    end
  end
end
