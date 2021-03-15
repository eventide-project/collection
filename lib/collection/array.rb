module Collection
  class Array
    include Collection

    def content
      @content ||= ::Array.new
    end
  end
end
