require_relative '../../automated_init'

context "Array" do
  context "Enumerable" do
    context "Each" do
      members = Controls::Array.example
      collection = Collection.Array(members)

      enumerator = collection.each

      detail enumerator
      is_enumerator = enumerator.class == Enumerator

      test "Is Enumerator" do
        assert(is_enumerator)
      end

      context "With Block" do
        yielded_members = []

        collection.each do |i|
          yielded_members << i
        end

        detail "Members: #{members}"

        test "Yields members" do
          comment yielded_members

          assert(yielded_members == members)
        end
      end
    end
  end
end
