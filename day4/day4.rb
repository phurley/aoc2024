require_relative '../../aoc-grid/lib/aocgrid'

XMAS_PATHS = Aoc::Cursor::DIRECTIONS.map { |d| [d] * 3 }
X_MAS_PATH = %i[nw se sw ne]
X_MS = %W(MS SM)
X_MAS = X_MS.product(X_MS).map(&:join)

def xmas_count(cursor)
  XMAS_PATHS.count { |path| cursor.path(path).join == 'MAS' }
end

def x_mas?(cursor)
  X_MAS.include?(cursor.offset_path(X_MAS_PATH).join)
end

g = Aoc::Grid.from_file(ARGV.first || 'input.txt')
puts 'Part 1'
pp(g.find_cursors('X').sum { |c| xmas_count(c) })

puts 'Part 2'
pp(g.find_cursors('A').count { |c| x_mas?(c) })
