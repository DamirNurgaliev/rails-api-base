class V1::ProfilesController < V1::BaseController
  def show
    render_data current_user
  end

  def update
    if current_user.update(user_params)
      render_data current_user, status: :ok
    else
      render_error current_user
    end
  end

  def destroy
    current_user.destroy

    render_data current_user
  end

  private

  def user_params
    jsonapi_params(only: %i[full_name email password])
  end
end
