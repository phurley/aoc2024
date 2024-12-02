# frozen_string_literal: true

def safe?(array)
  dir = array[0] <=> array[1]
  return false if dir.zero?
  array.each_cons(2).all? { |a,b| (a <=> b) == dir && (1..3).cover?((a - b).abs) }
end

pp ARGF.each_line.count { |a| safe?(a.split.map(&:to_i)) }
