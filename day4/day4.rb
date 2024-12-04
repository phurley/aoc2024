require_relative '../../aoc-grid/lib/aocgrid'

XMAS_PATHS = [
  %i[up up up],
  %i[down down down],
  %i[left left left],
  %i[right right right],

  %i[up_left up_left up_left],
  %i[up_right up_right up_right],
  %i[down_left down_left down_left],
  %i[down_right down_right down_right]
].freeze

X_MAS_PATHS = [
  %i[nw se sw ne],
  %i[se nw ne sw],
  %i[se nw sw ne],
  %i[nw se ne sw]
].freeze

def xmas_count(cursor)
  XMAS_PATHS.count { |path| cursor.path(path).join == 'MAS' }
end

def x_mas_count(cursor)
  X_MAS_PATHS.count { |path| cursor.offset_path(path).join == 'MSMS' }
end

g = Aoc::Grid.from_file(ARGV.first || 'input.txt')
puts 'Part 1'
pp(g.find_cursors('X').sum { |c| xmas_count(c) })

puts 'Part 2'
pp(g.find_cursors('A').sum { |c| x_mas_count(c) })
