module Articles
  class Serializer
    include ActionView::Helpers::SanitizeHelper
    attr_reader :article
    def initialize(article)
      @article = article
    end

    def serializable_hash
      hash = article.attributes
      hash[:tags] = article.tags.pluck(:name)
      hash[:content] = strip_tags(article.content).gsub(/[^0-9A-Za-z]/, ' ').split(' ').map(&:downcase).uniq
      hash
    end
  end
end
