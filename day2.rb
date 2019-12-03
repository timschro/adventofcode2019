# Run programme: ´ruby day2.rb´
# https://adventofcode.com/2019/day/2


def steps input
  for i in 0..(input.count - 1) do
    next unless i % 4 == 0
    return input if input[i] == 99
    if input[i] == 1
      input[input[i+3]] = input[input[i+1]] + input[input[i+2]]
    elsif input[i] == 2
      input[input[i+3]] = input[input[i+1]] * input[input[i+2]]
    else
      raise "E #{i}: #{input[i]}"
    end
  end
end

def prepare_input input
  content = input[0].split(',')
  content[1] = 12
  content[2] = 2
  content.each_index { |i| content[i] = content[i].to_i }
  content
end

def find_result input
  desired = 19690720
  for i in 0..99 do
    for j in 0..99 do
      content = input.dup
      content[1] = i
      content[2] = j
      steps(content)
      puts "#{100 * content[1] + content[2]}" if content[0] == desired
    end
  end
  
end

if $0 == __FILE__
  input = prepare_input(File.readlines("day2_input.txt"))
  res = steps(input)
  puts res[0]
  input = prepare_input(File.readlines("day2_input.txt"))
  find_result(input)
end


########## RSpec tests
# Run tests: ´rspec day1.rb´

require "rspec"

RSpec.describe "Day 2: " do

  it "1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2)." do
    expect(steps([1,0,0,0,99])).to eq([2,0,0,0,99])
  end
  
  it "2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6)." do
    expect(steps([2,3,0,3,99])).to eq([2,3,0,6,99])
  end
  
  it "2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801)." do
    expect(steps([2,4,4,5,99,0])).to eq([2,4,4,5,99,9801])
  end
  
  it "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99." do
    expect(steps([1,1,1,4,99,5,6,0,99])).to eq([30,1,1,4,2,5,6,0,99])
  end
end
