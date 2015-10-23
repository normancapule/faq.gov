class Api::V1::RegistrationsController < ApiController
  skip_before_action :authenticate_request

  def create
    user = User.create user_params
    if user.valid? && user.set_access_token
      render json:
        {
          auth_token: user.access_token,
          user_id: user.id
        }
    else
      render_obj_errors user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end

