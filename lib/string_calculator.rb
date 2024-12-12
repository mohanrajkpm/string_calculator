class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?

      delimiter = /,|\n/
      if numbers.start_with?("//")
        delimiter, numbers = numbers.split("\n", 2)
        delimiter = Regexp.escape(delimiter[2..])
      end
  
      nums = numbers.split(Regexp.new(delimiter)).map(&:to_i)
      negatives = nums.select(&:negative?)
      raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
  
      nums.sum
    end
end
  