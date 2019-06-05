# Data validator
class Validator
  MIN_YEAR = 1900
  MAX_YEAR = Time.now.year + 2
  BLANK = 'blank'.freeze

  def valid_year?(year)
    (MIN_YEAR..MAX_YEAR).cover? year.to_i
  end

  def trim_in_model?(data)
    trim, model = data.slice(:trim, :model).values
    blank_value?(trim) && model.split(' ').length >= 2
  end

  def blank_value?(value)
    value.nil? || value.empty? || value == BLANK
  end
end
