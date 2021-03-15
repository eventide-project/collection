require_relative '../../../automated_init'

context "Set" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Root Namespace Type Parameter" do
        module SomeModule
          SubString = Class.new(String)
        end

        type_parameter = SomeModule::SubString

        set_class = Collection::Set[type_parameter]

        test "The index value is the collection's class parameter" do
          assert(set_class.new.type_parameter == type_parameter)
        end

        context "Class Name" do
          type_parameter_name = type_parameter.name

          test "Derived from the type parameter's class" do
            assert(set_class.name == "Collection::Set::SomeModule_SubString")
          end
        end
      end
    end
  end
end
