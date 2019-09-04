open System
open System.IO
open System.Text.RegularExpressions

let rec decrypt (key: string) index encrypted decrypted =
    match encrypted with
    | [] -> decrypted
    | _ -> decrypt key (index + 1) (List.tail encrypted)
                   (List.append decrypted
                                [char ((int (List.head encrypted)) ^^^ (int key.[index % key.Length]))])

[<EntryPoint>]
let main (args : string[]) =
    let content = File.ReadAllText args.[0]
    let encrypted = (new Regex("\\s")).Replace(content, "").Split [|','|] |> Array.toList
    let key = "i hope in the next ten years there would be no other farewell letter brilliant than this one"
    printf "%s" (new string [|for c in (decrypt key 0 encrypted []) -> c|])
    0
