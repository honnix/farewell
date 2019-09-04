defmodule Farewell do
  use Bitwise

  def say(file_name) do
    {:ok, content} = File.read file_name
    encrypted = Regex.split(~r/,/, Regex.replace(~r/\s/, content, ""))
    IO.write decrypt('i hope in the next ten years there would be no other farewell letter brilliant than this one',
                    0, encrypted, <<>>)
  end

  defp decrypt(_, _, [], decrypted), do: decrypted

  defp decrypt(key, index, [h|t], decrypted) do
    decrypt(key, index + 1, t,
            decrypted <>
            <<Enum.at(key, rem(index, length(key))) ^^^ String.to_integer(h)>>)
  end
end

Farewell.say Enum.at(System.argv, 0)