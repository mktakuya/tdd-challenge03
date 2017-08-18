class EmailValidator
  def initialize(local_validator, domain_validator)
    @local_validator = local_validator
    @domain_validator = domain_validator
  end

  def valid?(addr)
    addr.include?('@') && 
    has_valid_domain?(addr) &&
    has_valid_local?(addr)
  end

  def has_valid_domain?(addr)
    true
  end

  def has_valid_local?(addr)
    true
  end
end
