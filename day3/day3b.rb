# frozen_string_literal: true

input = ARGF
        .readlines
        .join('')
        .scan(/mul\(\d+,\d+\)|don't\(\)|do\(\)/)

nums = input.reduce([true, []]) do |(state, acc), x|
    case x
    when 'do()'
      [true, acc]
    when "don't()"
      [false, acc]
    when /mul\((\d+),(\d+)\)/
      if state
        [state, acc << $1.to_i * $2.to_i]
      else
        [state, acc]
      end
    end
end

pp nums.last.sum
