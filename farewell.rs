use std::env;
use std::io::prelude::*;
use std::fs::File;

fn main() {
    let key = "i hope in the next ten years there would be no other farewell letter brilliant than this one".as_bytes();
    let key_len = key.len();

    let args: Vec<String> = env::args().collect();
    let mut encrypted = String::new();
    let mut f = File::open(&args[1]).expect("Unable to open file");
    f.read_to_string(&mut encrypted).expect("Unable to read string");

    encrypted = encrypted.replace("\n", "").replace("\t", "").replace(" ", "");
    let v: Vec<&str> = encrypted.split(',').collect();

    let mut decrypted = Vec::new();
    for i in 0..v.len() {
        let a = v[i].parse::<u8>().expect("Cannot parse to byte");
        let b = key[i % key_len];
        decrypted.push(a ^ b);
    }

    print!("{}", String::from_utf8(decrypted).expect("Cannot parse"));
}