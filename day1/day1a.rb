# frozen_string_literal: true

puts ARGF
  .read.scan(/\d+/)
  .map(&:to_i)
  .each_slice(2)
  .to_a
  .transpose
  .map(&:sort)
  .transpose
  .map { (_1 - _2).abs }
  .sum
