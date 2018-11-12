class V1::TokensController < V1::BaseController
  skip_before_action :authenticate_user

  def create
    result = CreateJwt.call(authentication_params)

    if result.success?
      render_data result.jwt_token, status: :created
    else
      head :unauthorized
    end
  end

  private

  def authentication_params
    jsonapi_params(only: %i[email password])
  end
end
