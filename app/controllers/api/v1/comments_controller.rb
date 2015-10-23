class Api::V1::CommentsController < ApiController
  before_filter :get_article
  before_filter :get_obj, except: [:index]

  def index
    render json: @article.comments
  end

  def show
    common_show
  end

  def update
    common_update
  end

  def create
    @obj = @article.comments.new(obj_params.merge(user_id: current_user.id))
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
    @obj = @article.comments.find(params[:id])
  end

  def obj_params
    params.require(:comment).permit(%i(
    content
    ))
  end
end

