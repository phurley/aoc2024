require 'aocgrid'

TURNS = {
  up: :right,
  right: :down,
  down: :left,
  left: :up
}

def loop?(guard, obstruction = nil)
  obstruction&.set('#')
  direction = :up
  path = Set.new
  while guard
    yield guard if block_given?
    return true if path.include?([guard, direction])

    path.add([guard, direction])
    direction = TURNS[direction] while guard.peek(direction) == '#'

    guard = begin
      guard.safe_move(direction)
    rescue Aoc::Error
      nil
    end
  end
  false
ensure
  obstruction&.set(' ')
end

map = Aoc::Grid.from_string(File.read(ARGV.first || 'tmp.txt').gsub('.', ' '))
start = map.find_cursors('^').first

path = Set.new
loop?(start) { |loc| path.add(loc) }
puts "Part 1: #{path.size}"

loops = path.count { |obstruction| loop?(start, obstruction) }
puts "Part 2: #{loops}"
