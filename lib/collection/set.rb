module Collection
  class Set
    include Collection

    def items
      @items ||= ::Set.new
    end
    alias :content :items

    def last
      items.to_a.last
    end

    def length
      count
    end
    alias :size :length
  end
end
