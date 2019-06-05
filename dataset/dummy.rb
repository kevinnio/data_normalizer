require_relative 'base'

module Dataset
  # Dummy dataset adapter
  class Dummy < Base
    MAKES = %w[Ford Chevrolet].freeze
    MODELS = %w[Focus Impala].freeze
    TRIMS = %w[ST SE].freeze

    def lookup_make(input)
      lookup(MAKES, input)
    end

    def lookup_model(input)
      lookup(MODELS, input)
    end

    def lookup_trim(input)
      lookup(TRIMS, input)
    end

    protected

    def lookup(constant, input)
      constant.find { |make| /^#{input}/i =~ make } || input
    end
  end
end
