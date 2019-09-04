let rec decrypt key index encrypted decrypted = match encrypted with
  [] -> decrypted
| _  -> decrypt key (index + 1) (List.tl encrypted)
      (decrypted @
       [Char.chr ((int_of_string (List.hd encrypted))
                    lxor
                  (Char.code key.[index mod (String.length key)]))]);;

(* copied from http://caml.inria.fr/mantis/view.php?id=5367 *)
let implode l =
  let res = String.create (List.length l) in
  let rec imp i = function
    | [] -> res
    | c :: l -> res.[i] <- c; imp (i + 1) l in
  imp 0 l;;

let encrypted = Str.split (Str.regexp ",") (Str.global_replace (Str.regexp "[\n\r\t ]") "" (Std.input_file Sys.argv.(1))) in
let key = "i hope in the next ten years there would be no other farewell letter brilliant than this one" in
print_string (implode (decrypt key 0 encrypted []))
