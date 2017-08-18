require 'spec_helper'
require 'output_processor'

describe OutputProcessor do
  describe "#initialize" do
    subject { processor }
    let(:processor) { OutputProcessor.new }

    it "OutputProcessorであること" do
      is_expected.to be_kind_of OutputProcessor
    end
  end

  describe "#execute" do
    before do
      $stdout = StringIO.new
    end

    it "配列を改行区切りで標準出力に表示すること" do
      OutputProcessor.new.execute(['ok', 'ng'])
      expect($stdout.string).to eq "ok\nng\n"
    end
  end
end
