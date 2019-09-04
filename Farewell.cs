using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
 
public class HelloWorld
{
    private const string key = "i hope in the next ten years there would be no other farewell letter brilliant than this one";

    public static void Main (string[] args)
    {
        string content = File.ReadAllText(args[0]);
        string[] encrypted = new Regex("\\s").Replace(content, "").Split(",".ToCharArray());
        StringBuilder decrypted = new StringBuilder();

        for (int i = 0; i < encrypted.Length; ++i)
        {
            decrypted.Append((char) (Int32.Parse(encrypted[i]) ^ key[i % key.Length]));
        }

        Console.Write(decrypted);
    }
}
