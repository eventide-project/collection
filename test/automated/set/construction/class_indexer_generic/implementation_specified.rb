require_relative '../../../automated_init'

context "Set" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Implementation Specified" do
        type_parameter = Controls::Class::Random.example

        collection_class = Collection::Set[type_parameter] do
          def some_method
            :some_value
          end
        end

        instance = collection_class.new

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Instance Type Parameter: #{instance.type_parameter.inspect}"
        comment "Class: #{collection_class.inspect}"

        context "Instance has Implementation" do
          test do
            refute_raises(NoMethodError) do
              instance.some_method
            end
          end
        end
      end
    end
  end
end
