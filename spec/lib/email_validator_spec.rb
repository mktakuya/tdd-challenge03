require 'spec_helper'
require 'email_validator'

describe EmailValidator do
  describe "#initialize" do
    subject { validator }
    let(:validator) { EmailValidator.new(nil, nil) }

    it "EmailValidatorのインスタンスを返すこと" do
      is_expected.to be_kind_of EmailValidator
    end

  end

  describe "#valid?" do
    subject { validator.valid?(addr) }
    let(:validator) { EmailValidator.new(nil, nil) }

    context "ドメイン部が正しいとき" do
      let(:addr) { "kuntaro1480@gmail.com" }
      before do
        allow(validator).to receive(:has_valid_domain?).and_return(true)
      end

      context "ローカル部が正しいとき" do
        before do
          allow(validator).to receive(:has_valid_local?).and_return(true)
        end

        it { is_expected.to be true }
      end
    end

    context "@が含まれていないとき" do
      let(:addr) { "kuntaro1480gmail.com" }

      it { is_expected.to be false }
    end

    context "ドメイン部が正しくないとき" do
      let(:addr) { "kuntaro1480@.gmail.com" }
      before do
        allow(validator).to receive(:has_valid_domain?).and_return(false)
      end

      it { is_expected.to be false }
    end

    context "ローカル部としても正しくないとき" do
      before do
        allow(validator).to receive(:has_valid_local?).and_return(false)
      end
      let(:addr) { ".kuntaro1480@gmail.com" }

      it { is_expected.to be false }
    end
  end
end