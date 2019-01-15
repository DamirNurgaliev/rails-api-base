class V1::TokensController < Knock::AuthTokenController
  include JsonApiController

  skip_before_action :verify_authenticity_token, only: :create

  def create
    render json: TokenSerializer.new(auth_token, is_collection: false), status: :created
  end

  private

  def entity_class
    User
  end

  def auth_params
    restify_param(:user).require(:user).permit(:email, :password)
  end
end
