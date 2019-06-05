module Dataset
  # Base dataset adapter
  class Base
    def lookup_make(_input)
      raise NotImplementedError
    end

    def lookup_model(_input)
      raise NotImplementedError
    end

    def lookup_trim(_input)
      raise NotImplementedError
    end
  end
end
