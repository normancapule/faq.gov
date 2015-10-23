module Queries
  class All
    def self.search(query)
      query = {
        query: {
          bool: {
            should: [{
              multi_match: {
                fields: %q(title),
                lenient: true,
                query: query,
              }
            }, {
              multi_match: {
                query: query,
                fields: %q(content),
                type: 'phrase',
                lenient: true
              },
            }]
          }
        },
        sort: [
          "_score",
          { 'created_at': 'desc'}
        ]
      }
      Elasticsearch::Model.search(query, [Article])
    end
  end
end
