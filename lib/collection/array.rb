module Collection
  class Array
    include Collection

    def items
      @items ||= ::Array.new
    end
    alias :content :items

    def last
      items.last
    end

    def length
      count
    end
    alias :size :length
  end
end
