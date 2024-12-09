filesystem = ARGF
             .each_char
             .map(&:to_i)
             .each_slice(2)
             .with_index
             .flat_map { |(file, free), id| [id] * file + [nil] * free.to_i }

freespace = filesystem.index(nil)
while freespace
  block = filesystem.pop
  block = filesystem.pop while block.nil?
  filesystem[freespace] = block
  freespace = filesystem.index(nil)
end

pp filesystem.each.with_index.map { _1 * _2 }.sum
