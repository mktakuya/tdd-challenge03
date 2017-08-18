class EmailValidator
  def initialize(local_validator, domain_validator)
    @local_validator = local_validator
    @domain_validator = domain_validator
  end

  def valid?(addr)
    res = addr.match(/\A(.*)@(.*)\z/)
    !res.nil? &&
    has_valid_domain?(res[2]) &&
    has_valid_local?(res[1])
  end

  def has_valid_domain?(str)
    @domain_validator.valid?(str)
  end

  def has_valid_local?(str)
    @local_validator.valid?(str)
  end
end
