require "rails_helper"
require "rspec_api_documentation/dsl"

describe V1::RegistrationsController do
  include_context "with JSON API Headers"

  resource "Users" do
    post "/registrations" do
      parameter :email, "Email", required: true
      parameter :full_name, "Full Name", required: true
      parameter :password, "Password", required: true

      let(:email) { "test@email.com" }
      let(:full_name) { "Richard Chong" }
      let(:password) { "123456" }

      let(:expected_data) do
        # [{
        #   "id" => "1",
        #   "type" => "control_performance_questionnaires",
        #   "attributes" => {
        #     "name" => "Some questionnaire"
        #   },
        #   "links" => {
        #     "self" => "http://#{account.sub_domain}.results.lvh.me/projects/#{results_collection_id}/questionnaires/1"
        #   }
        # }, {
        #   "id" => "2",
        #   "type" => "control_performance_questionnaires",
        #   "attributes" => {
        #     "name" => "Another questionnaire"
        #   },
        #   "links" => {
        #     "self" => "http://#{account.sub_domain}.results.lvh.me/projects/#{results_collection_id}/questionnaires/2"
        #   }
        # }]
        {}
      end

      let(:json_response_data) { JSON.parse(response_body)["data"] }

      example_request "Create User [success]" do
        expect(status).to eq 200

        expect(json_response_data).to eq(expected_data)
      end

      context "when params are invalid" do
        let(:password) { "12345" }

        example_request "Create User [error]" do
          expect(status).to eq 422
        end
      end
    end
  end
end
