require "rails_helper"

describe CreateJwt do
  let(:email) { "test@email.com" }
  let(:password) { "123456" }

  let!(:user) { create :user, email: email, password: password }

  describe "#call" do
    subject(:call) { described_class.call(email: email, password: password) }

    it "sets token in context" do
      expect(call.jwt_token).to be_present
    end

    context "when password is wrong" do
      let!(:user) { create :user, email: email, password: "123456" }
      let(:password) { "1234599" }

      it { is_expected.to be_failure }
    end

    context "when user does NOT exist" do
      let(:user) { nil }

      it { is_expected.to be_failure }
    end
  end
end
