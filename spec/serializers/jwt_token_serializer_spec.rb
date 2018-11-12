require "rails_helper"

describe JwtTokenSerializer do
  include_context "when JSON API serializer presented"

  let(:token) { build :jwt_token }
  let(:serializing_model) { token }
  let(:serialization_options) { { instance_stats: {} } }
  let(:expected_serialization_result_fields) { %w[token] }

  it_behaves_like "a json_api serializer"
end
