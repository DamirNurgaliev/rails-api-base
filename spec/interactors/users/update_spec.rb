require "rails_helper"

describe Users::Update do
  let(:user) { create :user, email: "sun@moon.com", password: "123456" }

  let(:params) do
    {
      email: "test@test.test"
    }
  end

  describe "#call" do
    subject(:call) { described_class.call(user: user, params: params) }

    it "updates users's attributes" do
      expect(call).to be_success

      expect(call.user.email).to eq "test@test.test"
    end

    context "when params invalid" do
      let(:params) { { email: "wrong email" } }

      it "does NOT update user's attributes" do
        expect(call).to be_failure

        expect(call.user.reload.email).to eq "sun@moon.com"
      end
    end
  end
end
