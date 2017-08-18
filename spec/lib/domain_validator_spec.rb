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
    subeject { validator.valid?(addr) }
    let(:validator) { DomainValidator }

    context 'ドメイン部が example.com のとき' do

    end

    context 'ドメイン部が sub.example.com のとき' do

    end

    context 'ドメイン部が example のとき' do

    end

    context 'ドメイン部が .aaa のとき' do

    end

    context 'ドメイン部が aaa. のとき' do

    end

    context 'ドメイン部が ' do

    end
  end
end
