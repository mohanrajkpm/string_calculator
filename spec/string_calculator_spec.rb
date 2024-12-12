require 'string_calculator'
require 'input_parser'
require 'number_extractor'
require 'number_validator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
        expect(StringCalculator.new.add("")).to eq(0)
    end

    it 'returns the number for a single number string' do
        expect(StringCalculator.new.add("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
        expect(StringCalculator.new.add("1,5")).to eq(6)
    end

    it 'handles newlines between numbers' do
        expect(StringCalculator.new.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiters' do
        expect(StringCalculator.new.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
        expect { StringCalculator.new.add("1,-2,-3") }
        .to raise_error("negative numbers not allowed -2,-3")
    end
  end


  describe InputParser do
    it 'parses input with custom delimiter' do
      parser = InputParser.new("//;\n1;2")
      expect(parser.parse).to eq([";", "1;2"])
    end

    it 'parses input with default delimiters' do
      parser = InputParser.new("1\n2,3")
      expect(parser.parse).to eq([/,|\n/, "1\n2,3"])
    end
  end

  describe NumberExtractor do
    it 'extracts numbers using the default delimiter' do
      extractor = NumberExtractor.new("1,2\n3", /,|\n/)
      expect(extractor.extract).to eq([1, 2, 3])
    end

    it 'extracts numbers using a custom delimiter' do
      extractor = NumberExtractor.new("1;2;3", ";")
      expect(extractor.extract).to eq([1, 2, 3])
    end
  end

  describe NumberValidator do
    it 'raises an error for negative numbers' do
      expect { NumberValidator.new([-1, 2, -3]).validate_no_negatives }
        .to raise_error("negative numbers not allowed -1,-3")
    end

    it 'does not raise an error for positive numbers' do
      expect { NumberValidator.new([1, 2, 3]).validate_no_negatives }.not_to raise_error
    end
  end
end