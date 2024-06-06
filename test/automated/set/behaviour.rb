require_relative '../automated_init'

context "Set" do
  context "Behaviour" do
    collection = Collection::Set.new(Integer)

    collection.add(1)
    test { assert(collection.include? 1) }
    test { assert(collection.size == 1) }
    collection.add(1)
    test { assert(collection.size == 1) }
    collection.add(2)
    test { assert(collection.size == 2) }
  end
end
