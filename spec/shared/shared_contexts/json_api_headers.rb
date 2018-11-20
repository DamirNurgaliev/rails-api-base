shared_context "with JSON API Headers" do
  header "Accept", "application/vnd.api+json"
end

shared_context "with JSON API Authorization header" do
  let(:user) { create :user }
  let(:jwt_token) { build :jwt_token, user: user }
  let(:authorization) { "Bearer #{jwt_token}" }

  header "Authorization", :authorization
end
