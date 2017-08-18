require 'spec_helper'
require 'input_parser'

describe InputParser do
  before { $stdin = StringIO.new("abc@example.com\na..bc@example.com") }

  describe '#initialize' do
    let(:parser) { InputParser.new }
    subject { parser }

    it { is_expected.to be_kind_of InputParser }
  end

  describe '#execute' do
    let(:parser) { InputParser.new }

    it '標準入力を受け取って改行区切りにして配列にして返す' do
      expect(parser.execute($stdin.read)).to match_array ['abc@example.com', 'a..bc@example.com']
    end
  end
end
