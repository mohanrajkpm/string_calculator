class InputParser
    def initialize(input)
      @input = input
    end
  
    def parse
      default_delimiter = /,|\n/
      if @input.start_with?("//")
        custom_delimiter, numbers = @input.split("\n", 2)
        custom_delimiter = Regexp.escape(custom_delimiter[2..])
        [custom_delimiter, numbers]
      else
        [default_delimiter, @input]
      end
    end
end
  