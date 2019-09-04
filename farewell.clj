(defn decrypt [encrypted]
  (let [key "i hope in the next ten years there would be no other farewell letter brilliant than this one"]
    (map bit-xor encrypted (map int (cycle key)))))

(let [content (slurp (first *command-line-args*))]
  (let [encrypted (map #(Integer/parseInt %) (re-seq #"\d+" (.replaceAll content "\\s", "")))]
    (print (apply str (map char (decrypt encrypted))))))