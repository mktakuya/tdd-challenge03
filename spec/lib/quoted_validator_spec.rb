require 'spec_helper'
require 'quoted_validator'

describe QuotedValidator do
  describe '#initialize' do
    subject { validator }
    let(:validator) { QuotedValidator.new }

    it 'QuotedValidator のインスタンスを返すこと' do
      is_expected.to be_kind_of QuotedValidator
    end
  end
end
