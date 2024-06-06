require_relative '../automated_init'

context "Set" do
  context "Length" do
    collection = Collection::Set.new(String)

    collection.add('something')
    initial_length = collection.length
    collection.add('something')
    length_difference = initial_length - collection.length
    length_has_no_difference = length_difference == 0

    test { assert(length_has_no_difference) }

    collection.add('something else')

    length = collection.length

    test do
      assert(length == 2)
    end
  end
end
