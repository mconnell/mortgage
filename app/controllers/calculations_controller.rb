class CalculationsController < ApplicationController

  def monthly
    interest_rates = [5,8]
    @deposit       = params[:deposit_percent].present? ? params[:deposit_percent].to_i :  10
    prices         = [55000.0, 70000.0, 85000.0, 100000.0, 115000.0, 130000.0, 145000.0, 160000.0, 175000.0, 190000.0, 205000.0]

    @results = prices.map do |price|
      interest_rates.map do |interest_rate|
        Calculator.new(price: price, annual_interest_rate: interest_rate, deposit_percent: @deposit)
      end
    end
  end

end
