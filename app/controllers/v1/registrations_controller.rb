class V1::RegistrationsController < V1::BaseController
  skip_before_action :authenticate_user!

  def create
    result = CreateUser.call(params: user_params)

    if result.success?
      respond_with_resource(result.user, status: :created, location: :v1_profile)
    else
      respond_with_resource_errors(result.user)
    end
  end

  private

  def user_params
    jsonapi_params(only: %i[full_name email password])
  end
end
