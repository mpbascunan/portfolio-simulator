require 'date'
##
# This is a mock class that represents a stock and generates random prices.
# In a real scenario, it should fetch the price from an API or a database.
class Stock
  def price(date)
    rand(1..1000)
  end
end

##
# Represents an investment portfolio of stocks.
# Performs calculations based on the stock prices at given dates.
class Portfolio
  def initialize(stocks = [])
    @stocks = stocks
  end

  def value_at(date)
    @stocks.sum { |stock| stock.price(date) }
  end

  def annualized_return(start_value, end_value, start_date, end_date)
    years = (end_date.year - start_date.year) + ((end_date.month - start_date.month) / 12.0)

    return 0 if years == 0

    (((end_value.to_f / start_value.to_f) ** (1 / years).to_f) - 1) * 100
  end

  def profit(start_date, end_date)
    start_value = value_at(start_date)
    end_value = value_at(end_date)

    profit_value = end_value - start_value

    {
      :profit => profit_value,
      :annualized_return => annualized_return(start_value, end_value, start_date, end_date),
    }
  end
end