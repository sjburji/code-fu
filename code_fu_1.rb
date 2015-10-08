##
# Print the second highest element within a list of numbers input from the command line
#
# Sample inputs
# 1 0 1 -4 0 -1 2 3 5 -5 -7 8 1 => '5'
# 5 3 2 8 9 1 12 => '9'

def highest(numbers)
  high = numbers[0]
  numbers[1..-1].each do |number|
    high = number if number > high
  end

  high
end

numbers = ARGV.map { |arg| arg.to_i }
puts "The second highest element in the list -\
  #{ numbers.join(' ') } is '#{ highest(numbers - [highest(numbers)]) }'"
