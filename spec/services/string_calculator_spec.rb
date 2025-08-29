require "rails_helper"

RSpec.describe StringCalculator do
  subject(:calc) { described_class.new }

  describe "#add" do
    it "returns 0 for empty string" do
      expect(calc.add("")).to eq(0)
    end

    it "returns the number for a single value" do
      expect(calc.add("1")).to eq(1)
    end

    it "sums two numbers separated by a comma" do
      expect(calc.add("1,2")).to eq(3)
    end

    it "handles an unknown amount of numbers" do
      expect(calc.add("1,2,3,4,5")).to eq(15)
    end

    it "handles new lines between numbers" do
      expect(calc.add("1\n2,3")).to eq(6)
    end

    it "supports a custom single-character delimiter" do
      expect(calc.add("//;\n1;2")).to eq(3)
    end

    it "raises an error for a single negative number" do
      expect { calc.add("-1") }.to raise_error("negatives not allowed: -1")
    end

    it "raises an error listing all negative numbers" do
      expect { calc.add("1,-2,-3,4") }.to raise_error("negatives not allowed: -2, -3")
    end

    it "ignores numbers bigger than 1000" do
      expect(calc.add("2,1001")).to eq(2)
      expect(calc.add("1000,2")).to eq(1002)
    end
  end
end
