class Api::V1::CategoriesController < ApiController
  before_filter :find_category, except: [:index]

  def index
    render json: Category.all
  end

  def create
    @obj = current_user.categories.create(category_params)
    common_create
  end

  def update
    common_update
  end

  def destroy
    common_destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @obj = Category.find(params[:id])
  end
end
