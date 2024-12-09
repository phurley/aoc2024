filesystem = ARGF
             .each_char
             .map(&:to_i)
             .each_slice(2)
             .with_index
             .map { |(file, free), id| [[id, file], [nil, free.to_i]] }
             .flatten(1)

pointer = filesystem.size
loop do
  file = filesystem[pointer -= 1]
  file = filesystem[pointer -= 1] while file.first.nil?
  break if pointer.zero?

  next unless (freespace = filesystem.find_index { |val, size| val.nil? && size >= file.last })
  next if freespace > pointer

  free_block = filesystem[freespace]
  new_block = [file]
  if (extra = free_block.last - file.last).positive?
    new_block += [[nil, extra]]
    pointer += 1
  end
  filesystem[freespace, 1] = new_block
  filesystem[pointer] = [nil, file.last]
  pointer -= 1
end

pp filesystem.reduce([0, 0]) { |(index, sum), (value, length)|
  [index + length, sum + length.times.sum { |n| (n + index) * value.to_i }]
}.last
