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

  describe '#valid?' do
    subject { validator.valid?(str) }
    let(:validator) { QuotedValidator.new }

    context '"kuntaro1480" のとき' do
      let(:str) { '"kuntaro1480"' }

      it { is_expected.to be true }
    end

    context '".kuntaro" のとき' do
      let(:str) { '".kuntaro"' }

      it { is_expected.to be true }
    end

    context '"kuntaro." のとき' do
      let(:str) { '"kuntaro."' }

      it { is_expected.to be true }
    end

    context '"kuntaro..ishiyama" のとき ' do
      let(:str) { '"kuntaro..ishiyama"' }

      it { is_expected.to be true }
    end

    context '"" のとき' do
      let(:str) { '""' }

      it { is_expected.to be true }
    end

    context '"@" のとき' do
      let(:str) { '"@"' }

      it { is_expected.to be true }
    end

    context '" のとき' do
      let(:str) { '"' }

      it { is_expected.to be false }
    end

    context '"aaaaa のとき' do
      let(:str) { '"aaaaa' }

      it { is_expected.to be false }
    end

    context 'aaaaa" のとき' do
      let(:str) { 'aaaaa"' }

      it { is_expected.to be false }
    end
  end
end
