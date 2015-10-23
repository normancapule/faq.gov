class ApiController < ActionController::Base
  include Auth
  include Response

  protect_from_forgery with: :null_session
  before_action :authenticate_request

end

