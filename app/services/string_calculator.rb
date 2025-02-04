# frozen_string_literal: true

# This Services discribe the String calculation function
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    numbers.split(',').map(&:to_i).sum
  end
end
