class NumberExtractor
    def initialize(numbers, delimiter)
      @numbers = numbers
      @delimiter = delimiter
    end
  
    def extract
      @numbers.split(Regexp.new(@delimiter)).map(&:to_i)
    end
end
  