# frozen_string_literal: true

# This Services describe the String calculation function
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/

    # Check for custom delimiter
    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2])
      numbers = parts[1]
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)

    # Validate for negative numbers
    negatives = nums.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(',')}" unless negatives.empty?

    nums.sum
  end
end
