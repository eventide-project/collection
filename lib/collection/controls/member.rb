# module Collection
#   module Controls
# ## Rename to Class
# ## And use SomeClass for the inner member class
#     module Member
#       def self.example
#         Class.example.new
#       end

#       module Root
#         def self.example
#           Class.random
#         end
#       end

#       module Class
#         def self.example
#           Member
#         end

#         def self.random
#           class_name = "Class#{SecureRandom.hex(2).upcase}"
#           Object.const_set(class_name, ::Class.new)
#         end

#         class Member
#         end
#       end
#     end
#   end
# end
