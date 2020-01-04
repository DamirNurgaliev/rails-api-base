FactoryBot.define do
  factory :jwt_token, class: "Knock::AuthToken" do
    transient do
      user { create :user }

      id { user.id }
    end

    payload { { "sub" => id } }

    initialize_with { new(payload: payload).token }
  end
end
