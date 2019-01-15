require "rails_helper"

describe UserSerializer do
  include_context "when JSON API serializer presented"

  let(:user) { create :user }
  let(:serializing_model) { user }
  let(:expected_serialization_result_fields) { %w[full_name email] }

  it_behaves_like "a json_api serializer"
end
