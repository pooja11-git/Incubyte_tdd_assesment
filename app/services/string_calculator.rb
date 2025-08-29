class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    nums = numbers.split(/,|\n/).map(&:to_i)
    nums.sum 
  end
end

