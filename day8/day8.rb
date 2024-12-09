require 'aocgrid'

g = Aoc::Grid.from_file(ARGV.first || 'input.txt')
ant = g.cursors { |_, v| v != '.' }.group_by(&:get)
part1 = Set.new
part2 = Set.new

ant.each do |_, nodes|
  nodes.permutation(2).each do |n1, n2|
    part2.add(n1)
    dx, dy = n1.delta(n2)
    nn = n1.safe_delta(-dx, -dy)
    next unless nn

    nn.set('#')
    part1.add(nn)

    while nn
      part2.add(nn)
      nn = nn.safe_delta(-dx, -dy)
    end
  end
end

puts "Part 1: #{part1.size}"
puts "Part 2: #{part2.size}"
