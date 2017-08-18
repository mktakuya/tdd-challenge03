require 'spec_helper'
require 'domain_validator'

describe DomainValidator do
  describe '#initialize' do
    subject { validator }
    let(:validator) { DomainValidator.new }

    it 'DomainValidatorのインスタンスを返すこと' do
      is_expected.to be_kind_of DomainValidator
    end
  end

  describe '#valid?' do
    subject { validator.valid?(str) }
    let(:validator) { DomainValidator.new }


    context 'example.com のとき' do
      let(:str) { "example.com" }

      it { is_expected.to be true }
    end

    context 'sub.example.com のとき' do
      let(:str) { "sub.example.com" }

      it { is_expected.to be true }
    end

    context 'example のとき' do
      let(:str) { "example" }

      it { is_expected.to be true }
    end

    context '.aaa のとき' do
      let(:str) { ".aaa" }

      it { is_expected.to be false }
    end

    context 'aaa. のとき' do
      let(:str) { "aaa." }

      it { is_expected.to be false }
    end

    context 'exmaple..com のとき ' do
      let(:str) { "example..com" }

      it { is_expected.to be false }
    end

    context '空文字列のとき' do
      let(:str) { "" }

      it { is_expected.to be false }
    end
  end
end
