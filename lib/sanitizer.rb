# Sanitize data for processing
class Sanitizer
  attr_reader :data, :validator

  def initialize(data, validator)
    @data = data
    @validator = validator
  end

  def sanitize
    replace_blank_values_with_nil(
      extract_trim_from_model_if_needed(data)
    )
  end

  protected

  def replace_blank_values_with_nil(data)
    data.to_a.map do |(key, value)|
      [
        key,
        validator.blank_value?(value) ? nil : value
      ]
    end.to_h
  end

  def extract_trim_from_model_if_needed(data)
    return data unless validator.trim_in_model?(data)

    model, trim = data[:model].split(' ')
    data.merge(model: model, trim: trim)
  end
end
