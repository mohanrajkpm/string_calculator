class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?

      delimiter, sanitized_numbers = InputParser.new(numbers).parse
      nums = NumberExtractor.new(sanitized_numbers, delimiter).extract
      NumberValidator.new(nums).validate_no_negatives
  
      nums.sum
    end
end
  