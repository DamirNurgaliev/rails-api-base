class Users::Update
  include Interactor

  delegate :user, :params, to: :context

  def call
    context.fail! unless user.update(params)
  end
end
