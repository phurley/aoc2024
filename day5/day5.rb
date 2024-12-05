rules, pages = ARGF.read.split("\n\n")
rules = Set.new(rules.each_line(chomp: true))
pages = pages.split.map { |p| p.split(',') }

fixed = pages.map { |p| p.sort { rules.include?("#{_2}|#{_1}") ? 1 : -1 } }
middle = fixed.map { |p| p[p.size / 2].to_i }
good, bad = middle.partition.with_index { |_, i| pages[i] == fixed[i] }

pp good.sum
pp bad.sum
