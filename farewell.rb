#!/usr/bin/env ruby

class String
  unless self.method_defined? "getbyte"
    define_method :getbyte do |pos|
      bytes.to_a[pos]
    end
  end
end

KEY = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

def decrypt(content)
  encrypted = content.gsub(/\s/, "").split(",")
  decrypted = []

  encrypted.each_with_index do |c, i|
    decrypted << (c.to_i ^ KEY.getbyte(i % KEY.bytesize))
  end

  decrypted.pack("c*")
end

puts decrypt File.read(ARGV[0])
