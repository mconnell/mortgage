class Calculator
  attr_accessor :price, :deposit_percent, :annual_interest_rate

  def initialize(options={})
    options.each do |attr, value|
      self.send("#{attr}=", value) if respond_to? attr
    end
  end

  def monthly
    {
      '10 Years' => monthly_cost(10),
      '15 Years' => monthly_cost(15),
      '20 Years' => monthly_cost(20),
      '25 Years' => monthly_cost(25),
      '30 Years' => monthly_cost(30),
      '35 Years' => monthly_cost(35),
      '40 Years' => monthly_cost(40),
    }
  end

  def deposit
    (price - principle).round(2)
  end

  private
  def monthly_cost(term_in_years)
    Refinance::Annuities.payment(monthly_interest, number_of_payments(term_in_years), principle).round(2)
  end

  def principle
    price * (1 - (deposit_percent / 100.0))
  end

  def number_of_payments(term_in_years)
    12 * term_in_years
  end

  def monthly_interest
    (annual_interest_rate / 12.0) / 100
  end
end
