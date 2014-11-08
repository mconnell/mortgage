class CalculationsController < ApplicationController

  def monthly
    interest_rates = [5,8]
    deposit        = 10
    prices         = [55000.0, 70000.0, 85000.0, 100000.0, 115000.0, 130000.0, 145000.0, 160000.0, 175000.0]

    @results = prices.map do |price|
      interest_rates.map do |interest_rate|
        Calculator.new(price: price, annual_interest_rate: interest_rate, deposit_percent: 10)
      end
    end
  end

end