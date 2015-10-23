module Articles
  class Serializer
    attr_reader :article
    def initialize(article)
      @article = article
    end

    def serializable_hash
      hash = article.attributes
      hash[:tags] = article.tags.pluck(:name)
      hash
    end
  end
end
