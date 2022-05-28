require_relative '../../automated_init'

context "Array" do
  context "Enumerable" do
    enumerable_included = Collection::Array.included_modules.include?(Enumerable)

    test "Module is included" do
      assert(enumerable_included)
    end
  end
end
