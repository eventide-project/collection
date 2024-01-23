require_relative '../../../automated_init'

context "Array" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Implementation Specified" do
        type_parameter = Controls::Member.example_class

        cls = Collection::Array[type_parameter] do
          def some_method
            :some_value
          end
        end

        instance = cls.new

        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Instance Type Parameter: #{instance.type_parameter.inspect}"
        comment "Class: #{cls.inspect}"

        context "Implementation" do
          result = instance.some_method

          test do
            assert(result == "some_value")
          end
        end
      end
    end
  end
end

__END__



        comment "Type Parameter: #{type_parameter.inspect}"
        comment "Instance Type Parameter: #{instance.type_parameter.inspect}"
        comment "Class: #{cls.inspect}"

        test "The index value is the collection's type parameter" do
          assert(instance.type_parameter == type_parameter)
        end

        context "Class Name" do
          type_parameter_name = type_parameter.name.gsub('::', '_')

          test "Derived from the type parameter's class" do
            assert(cls.name == "Collection::Array::#{type_parameter_name}")
          end
        end
      end
    end
  end
end
