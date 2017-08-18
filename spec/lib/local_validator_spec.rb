require 'spec_helper'
require 'local_validator'

describe LocalValidator do
  describe '#initialize' do
    it 'LocalValidator のインスタンスを返すこと' do
      is_expected.to be_kind_of LocalValidator
    end
  end

  describe '#valid?' do
    subject { validator.valid?('dummy') }
    let(:validator) { LocalValidator.new }

    context 'ドットアトム部が正しいとき' do
      before do
        allow(validator).to receive(:valid_as_dotatom?).and_return(true)
      end

      it { is_expected.to be true }
    end

    context 'クオーテット部が正しいとき' do
      before do
        allow(validator).to receive(:valid_as_quoted?).and_return(true)
      end

      it { is_expected.to be true }
    end

    context 'どちらとしても正しくないとき' do
      before do
        allow(validator).to receive(:valid_as_dotatom?).and_return(false)
        allow(validator).to receive(:valid_as_quoted?).and_return(false)
      end

      it { is_expected.to be false }
    end
  end
end

