require_relative '../automated_init'

context "Collection" do
  context "Equality" do
    context "Collections are not equal" do
      context "Different Class" do
        collection = Set.new
        other_collection = Collection::Set.new(String)

        not_equal = collection != other_collection

        test "Is not equal" do
          assert(not_equal)
        end
      end

      context "Different set type" do
        collection = Collection::Set.new(String)
        other_collection = Collection::Set.new(Integer)

        not_equal = collection != other_collection

        test "Is not equal" do
          assert(not_equal)
        end
      end

      context "Different entries" do
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
