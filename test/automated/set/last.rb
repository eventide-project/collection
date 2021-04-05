require_relative '../automated_init'

context "Set" do
  context "Last" do
    collection = Collection::Set.new(String)

    collection.add('something')
    collection.add('something else')

    last_item = collection.last

    test do
      assert(last_item == 'something else')
    end
  end
end
