equations = ARGF
            .each_line.map { _1.split(':') }
            .to_h
            .transform_keys(&:to_i)
            .transform_values { _1.scan(/\d+/).map(&:to_i) }

part1 = 0
part2 = 0
equations.each do |total, numbers|
  values1 = [numbers.first]
  values2 = [numbers.first]
  numbers[1..].each do |num|
    values1 = values1.flat_map { |val| [val + num, val * num] }
    values2 = values2.flat_map { |val| [val + num, val * num, "#{val}#{num}".to_i] }
  end
  part1 += total if values1.include?(total)
  part2 += total if values2.include?(total)
end

puts "Part 1: #{part1}"
puts "Part 2: #{part2}"
