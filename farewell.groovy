#!/usr/bin/env groovy

encrypted = new File(args[0]).getText().replaceAll("\\s", "").split(",")

key = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

decrypted = []
for (i in 0 .. (encrypted.length - 1)) {
    decrypted << ((char) (encrypted[i].toInteger() ^ ((int) key.charAt(i % key.length()))))
}

print decrypted.join("")