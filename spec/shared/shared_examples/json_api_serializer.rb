shared_context "when JSON API serializer presented" do
  let(:serializable_resource) { described_class.new(serializing_model) }
  let(:result) { JSON.parse serializable_resource.to_json }
  let(:data_block) { result["data"] }
  let(:included_block) { result["included"] }
  let(:errors_block) { result["errors"] }
  let(:id_field) { data_block["id"] }
  let(:type_field) { data_block["type"] }
  let(:attributes_block) { data_block["attributes"] }
  let(:relationships_block) { data_block["relationships"] }
  let(:links_block) { data_block["links"] }

  shared_examples "a json_api serializer" do
    describe "serialization" do
      subject { data_block }

      it { is_expected.to have_key "id" }
      it { is_expected.to have_key "type" }
      it { is_expected.to have_key "attributes" }

      describe "attributes" do
        it "serializes its representing model into JSON with the expected fields" do
          expect(attributes_block.keys).to match_array expected_serialization_result_fields.map(&:to_s)
        end
      end
    end
  end
end
