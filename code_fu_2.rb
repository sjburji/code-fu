##
# Print the neighbors of an element in a 3x3 integer matrix, given as input from the command line
#
# Sample test cases
# 2 3 4
# 5 6 7
# 8 9 1
#
# Input element, cases -
# 6 => 2 3 4 5 7 8 9 1
# 1 => 6 7 9
# 5 => 2 3 6 8 9

require 'highline/import'

numbers = ARGV.map { |arg| arg.to_i }

size = Math.sqrt(numbers.count)
puts 'Invalid input' and exit if size.floor == size and not size.floor.integer?

puts 'Input matrix -'
matrix = []
(0..size-1).each do |s|
  matrix << Array.new(size)
end
element = ask('Enter input element? ', Integer) { |q| numbers.include? q }

i = 0
row, col = -1, -1
(0..size - 1).each do |r|
  (0..size - 1).each do |c|
    matrix[r][c] = numbers[i]
    row, col = r, c if matrix[r][c] == element
    i += 1
  end
end

my_neighbors = []
(0..size - 1).each do |r|
  (0..size - 1).each do |c|
    my_neighbors << matrix[r][c] if (r == row - 1 || r == row + 1 || r == row) &&
      (c == col - 1 || c == col + 1 || c == col) && matrix[r][c] != element
  end
end

puts "I am #{element} and my neighbors are #{my_neighbors.join(' ')}"
