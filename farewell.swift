import Foundation

let key = "i hope in the next ten years there would be no other farewell letter brilliant than this one".characters.map { String($0) }
let key_len = key.count

let data = try String(contentsOfFile: CommandLine.arguments[1])
let encrypted = data.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ",")

var decrypted = [UInt8]()

for (index, element) in encrypted.enumerated() {
    let a = UInt32(element)
    let b = key[index % key_len].unicodeScalars.filter{$0.isASCII}.first?.value
    let c = a! ^ b!
    decrypted.append(UInt8(c))
}

print(String(bytes: decrypted, encoding: String.Encoding.utf8)!, terminator: "")
