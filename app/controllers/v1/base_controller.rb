class V1::BaseController < ActionController::API
  include Knock::Authenticable
  include JsonApiController

  before_action :authenticate_user
end
