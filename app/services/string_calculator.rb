# frozen_string_literal: true

# This Service describes the String calculation function
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /,|\n/

    # Check for custom delimiter
    if numbers.start_with?('//')
      parts = numbers.split("\n", 2)
      delimiter_part = parts[0]
      numbers = parts[1]

      if delimiter_part.include?('[')
        delimiters = delimiter_part.scan(/\[(.*?)\]/).flatten
        delimiter = delimiters.map { |d| Regexp.escape(d) }.join('|')
      else
        delimiter = Regexp.escape(delimiter_part[2])
      end
    end

    nums = numbers.split(/#{delimiter}/).map(&:to_i)

    # Validate for negative numbers
    negatives = nums.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(',')}" unless negatives.empty?

    nums.reject { |n| n > 1000 }.sum
  end
end
