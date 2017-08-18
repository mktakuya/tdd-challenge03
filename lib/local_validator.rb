require './lib/dotatom_validator'
require './lib/quoted_validator'

class LocalValidator
  def valid?(str)
    valid_as_dotatom?(str) || valid_as_quoted?(str)
  end

  def valid_as_dotatom?(str)
    validator = DotatomValidator.new
    validator.valid?(str)
  end

  def valid_as_quoted?(str)
    validator = QuotedValidator.new
    validator.valid?(str)
  end
end
