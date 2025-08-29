class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiters = [",", "\n"]

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)

      if header.include?("[")
        delimiters += header.scan(/\[(.*?)\]/).flatten.map { |d| Regexp.escape(d) }
      else
        delimiters << Regexp.escape(header[2..])
      end
    end

    nums = numbers.split(/#{delimiters.join("|")}/).map(&:to_i)

    negatives = nums.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    nums.select { |n| n <= 1000 }.sum
  end
end

