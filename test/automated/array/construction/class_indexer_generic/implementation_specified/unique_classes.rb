require_relative '../../../../automated_init'

context "Array" do
  context "Construction" do
    context "Class Indexer Generic" do
      context "Implementation Specified" do
        context "Classes with the Same Type Parameter and with an Implementation" do
          type_parameter = Controls::Member::Class.example

          cls_1 = Collection::Array[type_parameter] do
            def some_method
              :some_value
            end
          end

          cls_2 = Collection::Array[type_parameter] do
            def some_method
              :some_value
            end
          end

          comment "Type Parameter: #{type_parameter.inspect}"
          comment "Class 1: #{cls_1.inspect}"
          comment "Class 2: #{cls_2.inspect}"

          context do
            test "Are not reused" do
              refute(cls_1 == cls_2)
            end
          end
        end
      end
    end
  end
end
