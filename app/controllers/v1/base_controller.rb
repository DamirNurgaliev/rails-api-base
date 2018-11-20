class V1::BaseController < ActionController::API
  include Knock::Authenticable, JsonApiController

  before_action :authenticate_user
end
