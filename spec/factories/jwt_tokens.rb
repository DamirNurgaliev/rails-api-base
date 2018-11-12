FactoryBot.define do
  factory :jwt_token do
    transient do
      user { create :user }

      id { user.id }
    end

    payload { { "sub" => id } }

    initialize_with { new(payload: payload) }
  end
end
