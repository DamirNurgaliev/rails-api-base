require "rails_helper"

describe CreateUser do
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
    end

    it "sets up user fields from params" do
      expect(call.user.email).to eq "test@test.test"
    end

    context "when params invalid" do
      let(:params) { { email: "wrong email" } }

      it { is_expected.to be_failure }

      it "does NOT create User" do
        expect { call }.not_to change(User, :count)
      end
    end
  end
end
