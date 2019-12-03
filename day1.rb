# Run programme: ´ruby day1.rb´
# https://adventofcode.com/2019/day/1


def calculate_module_fuel mass, consider_fuel = false
  temp_fuel = (mass / 3).floor - 2
  return 0 unless temp_fuel > 0
  return temp_fuel unless consider_fuel
  temp_fuel + calculate_module_fuel(temp_fuel, consider_fuel)
end

def sum_fuel input, consider_fuel = false
  sum = 0
  input.each{|i| sum += calculate_module_fuel(i.to_i, consider_fuel)}
  sum
end


if $0 == __FILE__
  puts "Result part 1: #{sum_fuel(File.readlines("day1_input.txt"))}"
  puts "Result part 2: #{sum_fuel(File.readlines("day1_input.txt"), true)}"
end


########## RSpec tests
# Run tests: ´rspec day1.rb´

require "rspec"

RSpec.describe "Day 1: The Tyranny of the Rocket Equation: " do

  it "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2." do
    expect(calculate_module_fuel(12)).to eq(2)
  end
  it "For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2." do
    expect(calculate_module_fuel(14)).to eq(2)
  end
  it "For a mass of 1969, the fuel required is 654." do
    expect(calculate_module_fuel(1969)).to eq(654)
  end
  it "For a mass of 100756, the fuel required is 33583." do
    expect(calculate_module_fuel(100756)).to eq(33583)
  end
  it "The sum of fuels for the masses of 12, 14, 1969, 100756 is 34241" do
    expect(sum_fuel([12,14,1969,100756])).to eq(34241)
  end

  it "A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2 divided by 3 and rounded down is 0, which would call for a negative fuel), so the total fuel required is still just 2." do
    expect(calculate_module_fuel(14, true)).to eq(2)
  end
  it "At first, a module of mass 1969 requires 654 fuel. Then, this fuel requires 216 more fuel (654 / 3 - 2). 216 then requires 70 more fuel, which requires 21 fuel, which requires 5 fuel, which requires no further fuel. So, the total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966." do
    expect(calculate_module_fuel(1969, true)).to eq(966)
  end
  it "The fuel required by a module of mass 100756 and its fuel is: 33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346." do
    expect(calculate_module_fuel(100756, true)).to eq(50346)
  end
  
  it "The sum of fuels for the masses of 14, 1969, 100756 is 51314 considering the fuel mass" do
    expect(sum_fuel([14,1969,100756], true)).to eq(51314)
  end

end
