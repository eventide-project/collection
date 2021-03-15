module Collection
  class Set
    include Collection

    def content
      @content ||= ::Set.new
    end
  end
end
