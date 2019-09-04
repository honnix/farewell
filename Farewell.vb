Imports System
Imports System.IO
Imports System.Text
Imports System.Text.RegularExpressions

Public Module Farewell
   Sub Main(Byval args() As String)
       Dim key as String = "i hope in the next ten years there would be no other farewell letter brilliant than this one"
       Dim content as String = File.ReadAllText(args(0))
       Dim regex as New Regex("\s")
       Dim encrypted() as String = regex.Replace(content, "").Split(",".ToCharArray())
       Dim decrypted as New StringBuilder

       For i as Integer = 0 To encrypted.Length - 1
           decrypted.Append(Chr(Int32.Parse(encrypted(i)) Xor Asc(key(i Mod key.Length))))
       Next

       Console.Write(decrypted)
   End Sub
End Module
