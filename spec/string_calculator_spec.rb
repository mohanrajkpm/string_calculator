require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.new.add("")).to eq(0)
    end

    it 'returns the number for a single number string' do
        expect(StringCalculator.new.add("1")).to eq(1)
    end
  end
end