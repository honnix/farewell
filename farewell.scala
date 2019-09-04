#!/bin/sh
exec scala "$0" "$@"
!#

val Key = "i hope in the next ten years there would be no other farewell letter brilliant than this one";

val encrypted = scala.io.Source.fromFile(args(0)).mkString.replaceAll("\\s", "").split(",")
val sb = new StringBuilder

for (i <- encrypted.indices) {
  sb.append((encrypted(i).toInt ^ Key(i % Key.length)).asInstanceOf[Char])
}

print(sb)
