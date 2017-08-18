require 'spec_helper'
require 'local_validator'

describe LocalValidator do
  describe '#initialize' do
    it 'LocalValidator のインスタンスを返すこと' do
      is_expected.to be_kind_of LocalValidator
    end
  end
end

