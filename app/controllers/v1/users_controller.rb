class V1::UsersController < V1::BaseController
  skip_before_action :authenticate_user, only: :create

  def show
    render_data current_user
  end

  def create
    result = Users::Create.call(params: user_params)

    if result.success?
      render_data result.user, status: :created
    else
      render_error result.user
    end
  end

  def update
    result = Users::Update.call(user: current_user, params: user_params)

    if result.success?
      render_data result.user, status: :ok
    else
      render_error result.user
    end
  end

  def destroy
    current_user.destroy

    head :ok
  end

  private

  def user_params
    jsonapi_params(only: %i[full_name email password])
  end
end
