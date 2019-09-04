-module(farewell).
-export([say/1]).

decrypt(_, _, [], Decrypted) -> Decrypted;
decrypt(Key, Index, Encrypted, Decrypted) ->
    decrypt(Key, Index + 1, tl(Encrypted),
            Decrypted ++
            [(lists:nth((Index rem length(Key)) + 1, Key) bxor list_to_integer(hd(Encrypted)))]).

say(File) ->
    {ok, Content} = file:read_file(File),
    Encrypted = re:split(re:replace(Content,
                                    "\\s", "",
                                    [{return, list}, global]),
                         ",", [{return, list}]),
    io:fwrite(decrypt("i hope in the next ten years there would be no other farewell letter brilliant than this one",
                      0, Encrypted, [])).
