class NumberValidator
    def initialize(numbers)
      @numbers = numbers
    end
  
    def validate_no_negatives
      negatives = @numbers.select(&:negative?)
      raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
    end
end
  