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
  end
end
