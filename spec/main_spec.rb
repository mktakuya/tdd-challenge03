require 'spec_helper'
require "main"

describe Main do
  before do
    $stdin  = StringIO.new("abc@example.com\na..bc@example.com")
    $stdout = StringIO.new
  end

  let(:main) { Main.new }
  subject { main }

  describe '#initialize' do
    it { is_expected.to be_kind_of Main }
  end

  describe '#run' do
    it '正しく動作する' do
      main.run
      expect($stdout.string).to eq ("ok\nng\n")
    end
  end
end
