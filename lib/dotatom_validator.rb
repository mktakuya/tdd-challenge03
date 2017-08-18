class DotatomValidator
  def valid?(str)
    !str.nil? &&
      !str.match(/\A[a-zA-Z0-9!#\$%&'\*\+\-\/=\?\^_`\{\|\}~\.]*\z/).nil? &&
      str[0] != '.' &&
      str[-1] != '.' &&
      !str.include?('..') &&
      !str.empty?
  end
end
