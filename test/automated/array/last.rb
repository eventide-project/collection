require_relative '../automated_init'

context "Array" do
  context "Last" do
    collection = Collection::Array.new(String)

    collection.add('something')
    collection.add('something else')

    last_item = collection.last

    test do
      assert(last_item == 'something else')
    end
  end
end
