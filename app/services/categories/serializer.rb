module Categories
  class Serializer
    attr_reader :category
    def initialize(category)
      @category = category
    end

    def serializable_hash
      category.attributes
    end
  end
end

