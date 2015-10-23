module Response
  extend ActiveSupport::Concern

  def render_create_success obj = nil
    render json: @obj
  end

  def render_update_success
    render json: @obj
  end

  def render_empty_success
    render json: { }
  end

  def render_obj_errors obj = nil
    render json:
      {
        message: 'Error', errors: (obj || @obj).errors.full_messages
      }, status: 422
  end

end
