module Cacheable
  extend ActiveSupport::Concern

  included do
    after_destroy :remove_cache

    def remove_cache
      Indexer.perform_async('delete', self.id, self.class)
    end
  end
end
