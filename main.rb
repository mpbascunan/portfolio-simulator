require './portfolio'
require './date_validation'

portfolio = Portfolio.new([Stock.new, Stock.new])
puts "Welcome to the investment portfolio simulator!"
puts "Enter investment start date:"
start_date = parse_date(gets.chomp)

puts "Enter investment end date:"
end_date = parse_date(gets.chomp)

check_valid_date_range(start_date, end_date)

portfolio_profit = portfolio.profit(start_date, end_date)
puts "Profit: #{portfolio_profit[:profit]}"
puts "Annualized return: #{portfolio_profit[:annualized_return]} %"