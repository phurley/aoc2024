# frozen_string_literal: true

a, b = ARGF
       .read.scan(/\d+/)
       .map(&:to_i)
       .each_slice(2)
       .to_a
       .transpose

b = b.tally
puts a.map { _1 * b[_1].to_i }.sum
