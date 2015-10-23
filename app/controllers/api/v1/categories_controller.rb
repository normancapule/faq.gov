class Api::V1::CategoriesController < ApiController
  before_action :find_user, except: :index
  before_action :find_category, except: [:create, :index]

  def index
    render json: Category.all
  end

  def create
    @obj = @user.categories.create(category_params)
    if @obj.save
      render_create_success
    else
      render_obj_errors
    end
  end

  def update
    if @obj.update_attributes(category_params)
      render_update_success
    else
      render_obj_errors
    end
  end

  def destroy
    if @obj.destroy
      render_empty_success
    else
      render_obj_errors
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_user
    @user = User.find(current_user.id)
  end

  def find_category
    @obj = Category.find(params[:id])
  end
end

