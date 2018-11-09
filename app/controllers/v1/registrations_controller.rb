class V1::RegistrationsController < V1::BaseController
  skip_before_action :authenticate_user

  def create
    result = CreateUser.call(params: user_params)

    if result.success?
      render_data result.user, status: :created
    else
      render_error result.user
    end
  end

  private

  def user_params
    jsonapi_params(only: %i[full_name email password])
  end
end
