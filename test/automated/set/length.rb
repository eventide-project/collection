require_relative '../automated_init'

context "Set" do
  context "Length" do
    collection = Collection::Set.new(String)

    collection.add('something')
    collection.add('something')
    collection.add('something else')

    length = collection.length

    test do
      assert(length == 2)
    end
  end
end
