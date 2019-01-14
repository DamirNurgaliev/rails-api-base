require "rails_helper"
require "rspec_api_documentation/dsl"

describe V1::TokensController do
  resource "JSON API - Tokens" do
    include_context "with JSON API Headers"

    let!(:user) { create :user, email: email, password: "123456" }
    let(:jwt_token) { build :jwt_token, user: user }

    post "/v1/tokens" do
      with_options scope: %i[data attributes] do |klass|
        klass.parameter :email, "Email", required: true
        klass.parameter :password, "Password", required: true
      end

      let(:email) { "testing@mail.com" }
      let(:password) { "123456" }

      let(:expected_data) do
        {
          "id" => jwt_token,
          "type" => "token"
        }
      end

      let(:json_response_data) { JSON.parse(response_body)["data"] }

      example_request "Create Token [success]" do
        expect(status).to eq 201

        expect(json_response_data).to eq(expected_data)
      end

      context "when params are invalid" do
        let(:password) { "wrong_password" }

        example_request "Create Token [error]" do
          expect(status).to eq 404
        end
      end
    end
  end
end
