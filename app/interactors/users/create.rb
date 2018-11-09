class Users::Create
  include Interactor

  delegate :params, to: :context

  def call
    context.user = user

    context.fail! unless user.save
  end

  private

  def user
    @user ||= User.new(params)
  end
end
