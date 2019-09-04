# Farewell [![Build Status](https://secure.travis-ci.org/honnix/farewell.png?branch=master)](http://travis-ci.org/honnix/farewell)

I'm doing something that I've never seen somebody else did. This could be very
interesting for me and geeks, while maybe not to the other one's taste.

But anyway, I decide to go.

# How to

Decrypting programs are written by different types of programming languages that
I know and can really do hand-on work.

All those programs, no matter scripting, compiled, or native, only accept one argument
from command line, that is a file path, and the file contains encrypted content. The
output is purely string to stdout, so you can read it in terminal or redirect it to file,
but it's all up to you.

## One Shot

`rake`

> This will use README.md as input, encrypt into README.md.enc, then decrypt to README.md.dec,
and finally compare README.md with README.md.dec.

## farewell.rb

`ruby farewell.rb </path/to/encrypted/file>`

## farewell.py

`python farewell.py </path/to/encrypted/file>`

## farewell.c

1. `gcc -o farewell farewell.c`
2. `./farewell </path/to/encrypted/file>`

## Farewell.java

1. `javac Farewell.java`
2. `java Farewell </path/to/encrypted/file>`

## farewell.scala

`scala farewell.scala </path/to/encrypted/file>`

## farewell_dsl.scala

`scala farewell_dsl.scala </path/to/encrypted/file>`

## farewell.hs

1. `ghc --make farewell.hs`
2. `./farewell </path/to/encrypted/file>`

## farewell.pl

`perl farewell.pl </path/to/encrypted/file>`

## farewell.lisp

`clisp farewell.lisp </path/to/encrypted/file>`

## farewell.erl

1. `erlc farewell.erl`
2. `erl -noshell -s farewell say </path/to/encrypted/file> -s init stop`

## farewell.lua

`lua farewell.lua </path/to/encrypted/file>`

## farewell.sh

`sh farewell.sh </path/to/encrypted/file>`

## Farewell.cs

1. `gmcs Farewell.cs`
2. `mono Farewell.exe </path/to/encrypted/file>`

## Farewell.vb

1. `vbnc Farewell.vb`
2. `mono Farewell.exe </path/to/encrypted/file>`

## farewell.ml

1. ``ocamlc `ocamlfind query extlib -i-format` extLib.cma str.cma farewell.ml -o farewell``
2. `./farewell </path/to/encrypted/file>`

## farewell.go

1. `6g farewell.go`
2. `6l -o farewell farewell.6`
3. `./farewell </path/to/encrypted/file>`

## farewell.coffee

`coffee farewell.coffee </path/to/encrypted/file>`

## farewell.fs

1. `fsc farewell.fs`
2. `./farewell.exe </path/to/encrypted/file>`

## farewell.clj

`clojure farewell.clj </path/to/encrypted/file>`

## farewell.m

`octave -q farewell.m </path/to/encrypted/file>`

## farewell.pr

`swipl -f farewell.pr -g "decrypt('</path/to/encrypted/file>'), halt."`

## farewell.tcl

`tclsh farewell.tcl </path/to/encrypted/file>`

## farewell.rs

1. `rustc farewell.rs`
2. `./farewell </path/to/encrypted/file>`

## farewell.swift

`swift farewell.swift </path/to/encrypted/file>`

## farewell.exs

`elixir farewell.exs </path/to/encrypted/file>`

## farewell.dart

`dart farewell.dart </path/to/encrypted/file>`

# Web Version

1. `bundle install`
2. `rackup -s thin`

# TBD

* Assembly
* Smalltalk
* Pascal
* Delphi
* ...
