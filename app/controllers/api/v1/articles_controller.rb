class Api::V1::ArticlesController < ApiController
  before_filter :get_category, except: [:show]
  before_filter :get_obj, except: [:index, :show]

  def index
    render json: @category.articles
  end

  def show
    @obj = Article.find(params[:id])
    common_show
  end

  def update
    common_update
  end

  def create
    @obj = @category.articles.new(obj_params)
    common_create
  end

  def destroy
    common_destroy
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def get_obj
    @obj = @category.articles.find(params[:id])
  end

  def obj_params
    params.require(:article).permit(%i(
    title content
    ))
  end
end
