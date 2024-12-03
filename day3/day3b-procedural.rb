# frozen_string_literal: true

input = ARGF.readlines.join('')

result = 0
active = true

input.scan(/(mul\((\d+),(\d+)\)|don't\(\)|do\(\))/) do |op, a, b|
  case op
  when 'do()'
    active = true
  when "don't()"
    active = false
  else
    result += a.to_i * b.to_i if active
  end
end

pp result