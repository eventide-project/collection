module Collection
  class Array
    include Collection

    def content
      @content ||= ::Array.new
    end

    def last
      content.last
    end
  end
end
