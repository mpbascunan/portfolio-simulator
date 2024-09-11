require 'date'

##
# Converts a string into a Date object.
# Params:
# - date (String): An input provided by the user.
# Returns:
# - A Date object, or raises an exception if the date is not valid.
def parse_date(date)
  begin
    Date.parse(date)
  rescue ArgumentError
    raise Exception.new "Invalid date input."
  end
end

##
# Checks that the start date is earlier than the end date.
# Params:
# - start_date (Date object): Initial date provided by the user.
# - end_date (Date object): Final date provided by the user.
# Returns:
# - Raises an exception if the date range is not valid.
def check_valid_date_range(start_date, end_date)
  if start_date > end_date
      raise Exception.new "Date range must be valid"
  elsif end_date > Date.today
      raise Exception.new "End date must be prior to today"
  end
end