module Queries
  class All
    SEARCHATTRIBUTES = %w(content title name tags)
    def self.search(query)
      query = {
        query: {
          multi_match: {
            query: query,
            fields: SEARCHATTRIBUTES,
            lenient: true
          }
        },
        sort: [
          "_score",
          { 'created_at': 'desc'}
        ]
      }
      Elasticsearch::Model.search(query, [Article, Category])
    end
  end
end
