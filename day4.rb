def not_decreasing nmb
  nmbrs = nmb.to_s.scan /\d/
  (0..4).each {|i| return false if nmbrs[i] > nmbrs[i+1]}
  true
end

def has_pair nmb
  /(\d)\1+/.match?(nmb.to_s)
end

def has_single_pair nmb
  nmbrs = nmb.to_s.scan /\d/
  nmbrs.each {|n| return true if nmbrs.count(n) == 2}
  false
end


part1 = part2 = 0

(108457..562041).each do |i|
  next unless not_decreasing i
  next unless has_pair i
  part1 += 1
  next unless has_single_pair i
  part2 += 1
end

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"

