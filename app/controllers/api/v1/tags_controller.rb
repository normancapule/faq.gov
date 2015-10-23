class Api::V1::TagsController < ApiController
  before_filter :get_article
  before_filter :get_obj, except: [:index]

  def index
    render json: @article.tags
  end

  def show
    common_show
  end

  def update
    common_update
  end

  def create
    @obj = @article.tags.new(obj_params.merge(user_id: current_user.id))
    common_create
  end

  def destroy
    common_destroy
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def get_obj
    @obj = @article.tags.find(params[:id])
  end

  def obj_params
    params.require(:tag).permit(%i(
    name
    ))
  end
end

