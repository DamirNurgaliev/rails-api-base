require "rails_helper"
require "rspec_api_documentation/dsl"

describe V1::TokensController do
  resource "JSON API - Tokens" do
    include_context "with JSON API Headers"

    let!(:user) { create :user, email: email, password: password }
    let(:jwt_token) { build :jwt_token, user: user }
    let(:interactor_stub) { double "CreateJwt", jwt_token: jwt_token, success?: true }

    before do
      allow(CreateJwt).to receive(:call).with(email: email, password: password).and_return(interactor_stub)
    end

    post "/v1/tokens" do
      with_options scope: %i[data attributes] do |klass|
        klass.parameter :email, "Email", required: true
        klass.parameter :password, "Password", required: true
      end

      let(:email) { "testing@mail.com" }
      let(:password) { "123456" }

      let(:expected_data) do
        {
          "id" => jwt_token.token,
          "type" => "jwt_tokens",
          "attributes" => {
            "token" => jwt_token.token
          }
        }
      end

      let(:json_response_data) { JSON.parse(response_body)["data"] }

      example_request "Create Token [success]" do
        expect(status).to eq 201

        expect(json_response_data).to eq(expected_data)
      end

      context "when params are invalid" do
        let(:interactor_stub) { double "CreateJwt", success?: false }

        example_request "Create Token [error]" do
          expect(status).to eq 401
        end
      end
    end
  end
end
