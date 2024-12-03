#!/usr/bin/env clojure -M

(->> (slurp *in*)                              ; Read all input from stdin
       (re-seq #"\d+")                            ; Extract all digit sequences
       (map read-string)                          ; Convert strings to integers
       (partition 2)                              ; Group numbers into pairs
       (apply map vector)                         ; Transpose the list of pairs
       (map sort)                                 ; Sort each column
       (apply map vector)                         ; Transpose back to pairs
       (map (fn [[x y]] (abs (- x y))))           ; Calculate absolute differences
       (reduce +)                                 ; Sum all differences
       (println))                                 ; Print the result

