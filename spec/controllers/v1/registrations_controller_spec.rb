require "rails_helper"
require "rspec_api_documentation/dsl"

describe V1::RegistrationsController do
  resource "JSON API - Registrations" do
    include_context "with JSON API Headers"

    post "/v1/registrations" do
      with_options scope: %i[data attributes] do |klass|
        klass.parameter :email, "Email", required: true
        klass.parameter :full_name, "Full Name", required: true
        klass.parameter :password, "Password", required: true
      end

      let(:email) { "test@email.com" }
      let(:full_name) { "Richard Chong" }
      let(:password) { "123456" }

      let(:created_user) { User.find_by(email: email) }

      let(:expected_data) do
        {
          "id" => created_user.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "test@email.com",
            "full_name" => "Richard Chong"
          }
        }
      end

      let(:json_response_data) { JSON.parse(response_body)["data"] }
      let(:json_response_errors) { JSON.parse(response_body)["errors"] }

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
  end
end
