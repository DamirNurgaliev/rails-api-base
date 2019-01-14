class V1::UsersController < V1::BaseController
  skip_before_action :authenticate_user, only: :create

  def show
    render json: UserSerializer.new(current_user)
  end

  def create
    result = Users::Create.call(params: user_params)

    if result.success?
      render json: UserSerializer.new(result.user), status: 201
    else
      render_error result.user
    end
  end

  def update
    result = Users::Update.call(user: current_user, params: user_params)

    if result.success?
      render json: UserSerializer.new(result.user)
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
    restify_param(:user).require(:user).permit(:email, :full_name, :password)
  end
end
