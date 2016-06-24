require_relative 'automated_init'

module Foo
  class Bar
  end
end

context "Collection" do
  context "Construction" do
    collection = Collection[Foo::Bar].new

    context "By class indexer" do
      test "Constructs the instance" do
        refute(collection.nil?)
      end

      test "The index value is the collection's class parameter" do
        assert(collection.type_parameter == Foo::Bar)
      end

      test "The class's name is derived from the type parameter's class" do
        assert(collection.class.name == "Collection::Foo_Bar"p)
      end
    end
  end
end
