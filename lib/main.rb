require './lib/email_validator'
require './lib/domain_validator'
require './lib/local_validator'
require './lib/input_parser'
require './lib/output_processor'

class Main
  def initialize
    @ip = InputParser.new
    @op = OutputProcessor.new
    @validator = EmailValidator.new(LocalValidator.new, DomainValidator.new)
  end

  def run
    results = @ip.execute($stdin.read).map do |item|
      @validator.valid?(item) ? 'ok' : 'ng'
    end
    @op.execute(results)
  end
end

if __FILE__ == $0
  main = Main.new
  main.run
end
