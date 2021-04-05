module Collection
  class Set
    include Collection

    def content
      @content ||= ::Set.new
    end

    def last
      content.to_a.last
    end

    def length
      count
    end
    alias :size :length
  end
end
