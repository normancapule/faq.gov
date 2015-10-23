module CommonActions
  extend ActiveSupport::Concern

  def common_show
    render json: @obj
  end

  def common_update
    if @obj.update_attributes(obj_params)
      render_update_success
    else
      render_obj_errors
    end
  end

  def common_destroy
    @obj.destroy
    render_empty_success
  end

  def common_create
    if @obj.save
      render_create_success
    else
      render_obj_errors
    end
  end
end
