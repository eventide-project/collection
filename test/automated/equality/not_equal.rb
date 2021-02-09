require_relative '../automated_init'

context "Collection" do
  context "Equality" do
    context "Collections Are Not Equal" do
      context "Different Class" do
        collection = Set.new
        other_collection = Collection::Set.new(String)

        not_equal = collection != other_collection

        test "Is not equal" do
          assert(not_equal)
        end
      end

      context "Different Type Parameter" do
        collection = Collection::Set.new(String)
        other_collection = Collection::Set.new(Integer)

        not_equal = collection != other_collection

        test "Is not equal" do
          assert(not_equal)
        end
      end

      context "Different Entries" do
        collection = Collection::Set.new(String)
        other_collection = Collection::Set.new(String)

        collection.add('something')
        other_collection.add('something else')

        not_equal = collection != other_collection

        test "Is not equal" do
          assert(not_equal)
        end
      end
    end
  end
end
