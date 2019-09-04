#!/usr/bin/env clisp

;; copied from http://cl-cookbook.sourceforge.net/strings.html
(defun replace-all (string part replacement &key (test #'char=))
  "Returns a new string in which all the occurences of the part 
is replaced with replacement."
  (with-output-to-string (out)
                         (loop with part-length = (length part)
                               for old-pos = 0 then (+ pos part-length)
                               for pos = (search part string
                                                 :start2 old-pos
                                                 :test test)
                               do (write-string string out
                                                :start old-pos
                                                :end (or pos (length string)))
                               when pos do (write-string replacement out)
                               while pos)))

;; copied from http://cl-cookbook.sourceforge.net/strings.html
;; slightly modified
(defun split-by (string sep)
  (loop for i = 0 then (1+ j)
        as j = (position sep string :start i)
        collect (subseq string i j)
        while j))

(let ((content (format nil "~{~A~^~}"
                       (with-open-file (stream (first *args*))
                                       (loop for line = (read-line stream nil 'eof)
                                             until (eq line 'eof)
                                             collect line)))))
  (let ((encrypted (split-by (replace-all
                    (replace-all
                     (replace-all (replace-all content "\r" "") "\n" "")
                     "\t" "")
                    " " "") #\,)))
    (setq key "i hope in the next ten years there would be no other farewell letter brilliant than this one")
    (setq decrypted (loop for i from 0 to (- (list-length encrypted) 1)
          collect (code-char
                   (logxor (parse-integer (nth i encrypted))
                           (char-code (schar key (mod i (length key))))))))
    (princ (format nil "~{~A~^~}" decrypted))))
