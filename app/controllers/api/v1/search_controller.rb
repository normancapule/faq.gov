class Api::V1::SearchController < ApiController

  skip_before_action :authenticate_request

  def index
    render json: create_json('all', Queries::All.search(params[:query].to_s))
  end

  private

  def create_json(attribute, collection)
    page = params["#{attribute}_page"].present? ? params["#{attribute}_page"] : 1
    {
      collection: collection.page(page).results.map(&:_source),
      metadata: {
        count: collection.total_count,
        page: page
      }
    }
  end
end
