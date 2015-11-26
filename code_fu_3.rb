##
# Print the last index where you are able to form "AUTOBOT", given a string as input
# The letters making up "AUTOBOT" need not be in order, index starts with 0
#
# Sample inputs -
# HATJFUJBQWOOLSTSD => 14
# AUTOBO => -1
# TOBAOERT CKTABUS => 14

sample = ARGV.join('_')
auto = {}
autobot_flag = false
(0..(sample.length - 1)).each do |index|
  auto["#{sample[index]}"] = (auto["#{sample[index]}"] || 0) + 1

  if (auto["A"] || 0) >= 1 && (auto["U"] || 0) >= 1 && (auto["T"] || 0) >= 2 && (auto["O"] || 0) >= 2 && (auto["B"] || 0) >= 1
    puts "AUTOBOT index for #{sample} is #{index}"
    autobot_flag = true
    break
  end
end

puts -1 unless autobot_flag
