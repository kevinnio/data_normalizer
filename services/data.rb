module Services
  # Data normalizer
  class Data
    attr_reader :dataset, :validator

    def initialize(dataset:, validator:)
      @dataset = dataset
      @validator = validator
    end

    def normalize(data)
      year, make, model, trim = data.slice(:year, :make, :model, :trim).values

      # Normalize year
      year = year.to_i if validator.valid_year?(year)
      # Normalize make
      make = dataset.lookup_make(make)
      # Normalize model
      model = dataset.lookup_model(model)
      # Normalize trim
      trim = validator.blank_value?(trim) ? nil : dataset.lookup_trim(trim)

      data.merge(year: year, make: make, model: model, trim: trim)
    end
  end
end
