#!/bin/sh
exec scala "$0" "$@"
!#

// ======== everything in between is just fuyun ========
class Using(file: String) {
  def using(key: String) {
    val encrypted = scala.io.Source.fromFile(file).mkString.replaceAll("\\s", "").split(",")
    val sb = new StringBuilder

    for (i <- encrypted.indices) {
      sb.append((encrypted(i).toInt ^ key(i % key.length)).asInstanceOf[Char])
    }

    print(sb)
  }
}

object decrypt

class And(file: String) {
  def and(d: AnyRef) = new Using(file)
}

object Open {
  def file(file: String) = new And(file)
}
// =====================================================

Open file args(0) and decrypt using "i hope in the next ten years there would be no other farewell letter brilliant than this one"
