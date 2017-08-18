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
end
