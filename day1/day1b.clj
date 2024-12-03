#!/usr/bin/env clojure -M

(ns convert-ruby-to-clojure.core
  (:gen-class))

(defn -main []
  ;; Step 1: Read all input from standard input
  (let [input (slurp *in*)
        ;; Step 2: Extract all digit sequences using regex
        numbers (map read-string (re-seq #"\d+" input))
        ;; Step 3: Group numbers into pairs
        pairs (partition 2 numbers)
        ;; Step 4: Transpose the list of pairs to get two separate lists: a and b
        [a b] (apply map vector pairs)
        ;; Step 5: Tally the occurrences of each element in b
        b-freq (frequencies b)
        ;; Step 6: Multiply each element in a by its corresponding tally in b
        products (map #( * % (get b-freq % 0)) a)
        ;; Step 7: Sum the resulting products
        result (reduce + products)]
    ;; Step 8: Print the result
    (println result)))

;; Invoke the main function
(-main)
