require "rails_helper"

describe Users::Create do
  let(:params) do
    {
      email: "test@test.test",
      password: "password"
    }
  end

  describe "#call" do
    subject(:call) { described_class.call(params: params) }

    it "creates User" do
      expect { call }.to change(User, :count).by(1)

      expect(call.user.email).to eq "test@test.test"
    end

    context "when params invalid" do
      let(:params) { { email: "wrong email" } }

      it "does NOT create User" do
        expect(call).to be_failure

        expect { call }.not_to change(User, :count)
      end
    end
  end
end
