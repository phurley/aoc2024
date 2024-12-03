# frozen_string_literal: true

pp ARGF
  .readlines
  .join('')
  .scan(/mul\(\d+,\d+\)|don't\(\)|do\(\)/)
  .reduce([true, []]) { |(state, acc), op| 
    case op
    when 'do()'
      [true, acc]
    when "don't()"
      [false, acc]
    when /mul\((\d+),(\d+)\)/
      state ? [state, acc + [$1.to_i * $2.to_i]] : [state, acc]
    end
  }
  .last
  .sum
