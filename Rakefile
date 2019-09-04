CLEAN = %w{*.o *.hi *.pyc *.class *.dec *.enc *.dump *.beam *.cmi *.cmo *.togo farewell *.exe}

DIFF_COMMAND = "diff -u README.md README.md.dec 2>&1"
REDIRECT = "README.md.enc > README.md.dec"

def complain?(which)
  fail "#{which} version sucks" unless `#{DIFF_COMMAND}`.empty?  
end

desc "One Shot"
task :default =>  [:farewell_ruby,
                   :farewell_python,
                   :farewell_java,
                   :farewell_scala,
                   :farewell_dsl_scala,
                   :farewell_c,
                   :farewell_haskell,
                   :farewell_perl,
                   :farewell_js,
                   :farewell_lisp,
                   :farewell_erlang,
                   :farewell_lua,
                   :farewell_groovy,
                   :farewell_ocaml,
                   :farewell_sh,
                   :farewell_cs,
                   :farewell_vb,
                   :farewell_go,
                   :farewell_coffee,
                   :farewell_fs,
                   :farewell_clj,
                   :farewell_m,
                   :farewell_pr,
                   :farewell_tcl,
                   :farewell_rs,
#                   :farewell_swift,
                   :farewell_elixir,
                   :farewell_dart,
                   :clean]

desc "Clean"
task :clean do
  CLEAN.each { |f| `rm -f #{f}`}
end

task :encrypt => :clean do
  `ruby encrypt.rb README.md > README.md.enc`

  Rake::Task[:encrypt].reenable
  Rake::Task[:clean].reenable
end

desc "Ruby Version"
task :farewell_ruby => :encrypt do
  `ruby farewell.rb #{REDIRECT}`
  complain? "ruby"
end

desc "Python Version"
task :farewell_python => :encrypt do
  `python farewell.py #{REDIRECT}`
  complain? "python"
end

desc "Java Version"
task :farewell_java => :encrypt do
  `javac Farewell.java`
  `java Farewell #{REDIRECT}`
  complain? "java"
end

desc "Scala Version"
task :farewell_scala => :encrypt do
  `scala farewell.scala #{REDIRECT}`
  complain? "scala"
end

desc "Scala DSL Version"
task :farewell_dsl_scala => :encrypt do
  `scala farewell_dsl.scala #{REDIRECT}`
  complain? "scala_dsl"
end

desc "C Version"
task :farewell_c => :encrypt do
  `gcc -o farewell farewell.c`
  `./farewell #{REDIRECT}`
  complain? "c"
end

desc "Haskell Version"
task :farewell_haskell => :encrypt do
  `ghc --make farewell.hs`
  `./farewell #{REDIRECT}`
  complain? "haskell"
end

desc "Perl Version"
task :farewell_perl => :encrypt do
  `perl farewell.pl #{REDIRECT}`
  complain? "perl"
end

desc "NodeJS Version"
task :farewell_js => :encrypt do
  `node farewell.js #{REDIRECT}`
  complain? "javascript"
end

desc "Common Lisp Version"
task :farewell_lisp => :encrypt do
  `clisp farewell.lisp #{REDIRECT}`
  complain? "lisp"
end

desc "Erlang Version"
task :farewell_erlang => :encrypt do
  `erlc farewell.erl`
  `erl -noshell -s farewell say README.md.enc -s init stop > README.md.dec`
  complain? "erlang"
end

desc "Lua Version"
task :farewell_lua => :encrypt do
  `lua farewell.lua #{REDIRECT}`
  complain? "lua"
end

desc "Groovy Version"
task :farewell_groovy => :encrypt do
  `groovy farewell.groovy #{REDIRECT}`
  complain? "groovy"
end

desc "Shell Version"
task :farewell_sh => :encrypt do
  `bash farewell.sh #{REDIRECT}`
  complain? "sh"
end

desc "Csharp Version"
task :farewell_cs => :encrypt do
  `gmcs Farewell.cs`
  `mono Farewell.exe #{REDIRECT}`
  complain? "csharp"
end

desc "VB Version"
task :farewell_vb => :encrypt do
  `vbnc Farewell.vb`
  `mono Farewell.exe #{REDIRECT}`
  complain? "vb"
end

desc "OCaml Version"
task :farewell_ocaml => :encrypt do
  `ocamlc #{`ocamlfind query extlib -i-format`.strip} extLib.cma str.cma farewell.ml -o farewell`
  `./farewell #{REDIRECT}`
  complain? "ocaml"
end

desc "Go Version"
task :farewell_go => :encrypt do
  # compiler, linker = if RUBY_PLATFORM =~ /^x86_64.+/; %w{6g 6l} else %w{8g 8l} end
  # `#{compiler} -o farewell.togo farewell.go`
  # `#{linker} -o farewell farewell.togo`
  `go build farewell.go`
  `./farewell #{REDIRECT}`
  complain? "go"
end

desc "CoffeeScript Version"
task :farewell_coffee => :encrypt do
  `coffee farewell.coffee #{REDIRECT}`
  complain? "coffee"
end

desc "FSharp Version"
task :farewell_fs => :encrypt do
  `~/bin/FSharp-2.0.0.0/bin/fsc.exe farewell.fs`
  `./farewell.exe #{REDIRECT}`
  complain? "fs"
end

desc "Clojure Version"
task :farewell_clj => :encrypt do
  `clojure farewell.clj #{REDIRECT}`
  complain? "clj"
end

desc "Octave Version"
task :farewell_m => :encrypt do
  `octave -q farewell.m #{REDIRECT}`
  complain? "m"
end

desc "Prolog Version"
task :farewell_pr => :encrypt do
  `swipl -f farewell.pr -g "decrypt('README.md.enc'), halt." > README.md.dec`
  complain? "pr"
end

desc "Tcl Version"
task :farewell_tcl => :encrypt do
  `tclsh farewell.tcl #{REDIRECT}`
  complain? "tcl"
end

desc "Rust Version"
task :farewell_rs => :encrypt do
  `rustc farewell.rs`
  `./farewell #{REDIRECT}`
  complain? "rust"
end

desc "Swift Version"
task :farewell_swift => :encrypt do
  `swift farewell.swift #{REDIRECT}`
  complain? "swift"
end

desc "Elixir Version"
task :farewell_elixir => :encrypt do
  `elixir farewell.exs #{REDIRECT}`
  complain? "elixir"
end

desc "Dart Version"
task :farewell_dart => :encrypt do
  `dart farewell.dart #{REDIRECT}`
  complain? "dart"
end

desc "Deploy to CloudFoundry"
task :deploy do
  output = `cd web; vmc update farewell --runtime ruby19; cd ..`
  puts output
end

