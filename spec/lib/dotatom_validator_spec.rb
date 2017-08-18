require 'spec_helper'
require 'dotatom_validator'

describe DotatomValidator do
  describe '#initialize' do
    subject { validator }
    let(:validator) { DotatomValidator.new }

    it 'DotatomValidatorのインスタンスを返すこと' do
      is_expected.to be_kind_of DotatomValidator
    end
  end

  describe '#valid?' do
    subject { validator.valid?(str) }
    let(:validator) { DotatomValidator.new }


    context 'kuntaro1480 のとき' do
      let(:str) { "kuntaro1480" }

      it { is_expected.to be true }
    end

    context '.kuntaro のとき' do
      let(:str) { ".kuntaro" }

      it { is_expected.to be false }
    end

    context 'kuntaro. のとき' do
      let(:str) { "kuntaro." }

      it { is_expected.to be false }
    end

    context 'kuntaro..ishiyama のとき ' do
      let(:str) { "kuntaro..ishiyama" }

      it { is_expected.to be false }
    end

    context '空文字列のとき' do
      let(:str) { "" }

      it { is_expected.to be false }
    end
  end
end