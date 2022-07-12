require_relative '../../automated_init'

context "Array" do
  context "Equality" do
    context "Not Equal" do
      context "Different Class" do
        collection = Array.new
        other_collection = Collection::Array.new(String)

        not_equal = collection != other_collection

        test do
          assert(not_equal)
        end
      end

      context "Different Type Parameter" do
        collection = Collection::Array.new(String)
        other_collection = Collection::Array.new(Integer)

        not_equal = collection != other_collection

        test do
          assert(not_equal)
        end
      end

      context "Different Entries" do
        collection = Collection::Array.new(String)
        other_collection = Collection::Array.new(String)

        collection.add('something')
        other_collection.add('something else')

        not_equal = collection != other_collection

        test do
          assert(not_equal)
        end
      end
    end
  end
end
