require 'rails_helper'

RSpec.describe Calculator do

  describe "#monthly" do
    it "returns a hash of years to monthly costs" do
      calculator = Calculator.new price: 100000.0, annual_interest_rate: 5, deposit_percent: 10

      expect(calculator.monthly).to eq({
        "10 Years" => 954.59,
        "15 Years" => 711.71,
        "20 Years" => 593.96,
        "25 Years" => 526.13,
        "30 Years" => 483.14,
        "35 Years" => 454.22,
        "40 Years" => 433.98
      })
    end
  end

end
