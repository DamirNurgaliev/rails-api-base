require "rails_helper"
require "rspec_api_documentation/dsl"

describe V1::UsersController do
  resource "JSON API - Users" do
    include_context "with JSON API Headers"

    let(:json_response_data) { JSON.parse(response_body)["data"] }
    let(:json_response_errors) { JSON.parse(response_body)["errors"] }

    get "/v1/users" do
      include_context "with JSON API Authorization header"

      let(:user) { create :user, email: "robert@lewandovsky.com", full_name: "Robert L." }

      let(:expected_data) do
        {
          "id" => user.id.to_s,
          "type" => "user",
          "attributes" => {
            "email" => "robert@lewandovsky.com",
            "full_name" => "Robert L."
          }
        }
      end

      example_request "Get User [success]" do
        expect(status).to eq 200

        expect(json_response_data).to eq(expected_data)
      end

      context "when jwt token isn't correct" do
        let(:jwt_token) { double :jwt_token, token: "123" }

        example_request "Get User [error]" do
          expect(status).to eq 401
        end
      end
    end

    post "/v1/users" do
      with_options scope: %i[data attributes] do |klass|
        klass.parameter :full_name, "Full Name"
        klass.parameter :email, "Email", required: true
        klass.parameter :password, "Password", required: true
      end

      let(:email) { "test@email.com" }
      let(:full_name) { "Richard Chong" }
      let(:password) { "123456" }

      let(:created_user) { User.find_by(email: email) }

      let(:expected_data) do
        {
          "id" => created_user.id.to_s,
          "type" => "user",
          "attributes" => {
            "email" => "test@email.com",
            "full_name" => "Richard Chong"
          }
        }
      end

      example_request "Create User [success]" do
        expect(status).to eq 201

        expect(json_response_data).to eq(expected_data)
      end

      context "when params are invalid" do
        let(:password) { "12345" }

        example_request "Create User [error]" do
          expect(status).to eq 422

          expect(json_response_errors.first["detail"]).to eq "is too short (minimum is 6 characters)"
        end
      end
    end

    patch "/v1/users" do
      include_context "with JSON API Authorization header"

      with_options scope: %i[data attributes] do |klass|
        klass.parameter :email, "Email"
        klass.parameter :full_name, "Full Name"
        klass.parameter :password, "Password"
      end

      let(:email) { "new@email.com" }
      let(:full_name) { "Kylian Mbappe" }
      let(:password) { "12345609" }

      let(:expected_data) do
        {
          "id" => user.id.to_s,
          "type" => "user",
          "attributes" => {
            "email" => "new@email.com",
            "full_name" => "Kylian Mbappe"
          }
        }
      end

      example_request "Update User [success]" do
        expect(status).to eq 200

        expect(json_response_data).to eq(expected_data)
      end

      context "when params are invalid" do
        let(:password) { "12345" }

        example_request "Update User [error]" do
          expect(status).to eq 422

          expect(json_response_errors.first["detail"]).to eq "is too short (minimum is 6 characters)"
        end
      end
    end

    delete "/v1/users" do
      include_context "with JSON API Authorization header"

      example_request "Delete User [success]" do
        expect(status).to eq 200
      end

      context "when jwt token isn't correct" do
        let(:jwt_token) { double :jwt_token, token: "123" }

        example_request "Delete User [error]" do
          expect(status).to eq 401
        end
      end
    end
  end
end
