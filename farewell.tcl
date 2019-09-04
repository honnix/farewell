set key "i hope in the next ten years there would be no other farewell letter brilliant than this one"
set key_length [string length $key]

set fp [open [lindex $argv 0] r]
set file_data [read $fp]
close $fp

set encrypted [split [regsub -all {\s+} $file_data ""] ","]

set decrypted ""
set index 0

foreach c $encrypted {
    set k [scan [string index $key [expr $index % $key_length]] "%c"]
    append decrypted [format "%c" [expr $c ^ $k]]
    incr index
}

puts -nonewline [encoding convertfrom utf-8 $decrypted]
