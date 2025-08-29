class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiters = [",", "\n"]

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      custom_delimiter = header[2..]
      delimiters << Regexp.escape(custom_delimiter)
    end

    nums = numbers.split(/#{delimiters.join("|")}/).map(&:to_i)
    negatives = nums.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?
    nums.sum 
  end
end

