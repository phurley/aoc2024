# frozen_string_literal: true

pp ARGF
  .readlines
  .join('')
  .scan(/mul\((\d+),(\d+)\)/)
  .reduce(0) { |acc, (a, b)| acc + a.to_i * b.to_i }
