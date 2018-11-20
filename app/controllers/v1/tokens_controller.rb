class V1::TokensController < Knock::AuthTokenController
  include JsonApiController

  skip_before_action :verify_authenticity_token, only: :create

  def create
    render json: response_data, status: :created
  end

  private

  def response_data
    { data: { id: auth_token.token, type: "tokens" } }
  end

  def entity_class
    User
  end

  def auth_params
    jsonapi_params(only: %i[email password])
  end
end
