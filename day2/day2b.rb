# frozen_string_literal: true

def safe?(array)
  dir = array[0] <=> array[1]
  return false if dir.zero?
  array.each_cons(2).all? { |a,b| (a <=> b) == dir && (1..3).cover?((a - b).abs) }
end

def mostly_safe?(array)
  array.combination(array.size - 1).any? { |a| safe?(a) }
end

pp ARGF.each_line.count { |a| mostly_safe?(a.split.map(&:to_i)) }


