module Collection
  class Array
    include Collection

    def content
      @content ||= ::Array.new
    end

    def last
      content.last
    end

    def length
      count
    end
    alias :size :length
  end
end
