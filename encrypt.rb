KEY = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

def encrypt(content)
  encrypted = []

  (0 ... content.bytesize).each do |i|
    encrypted << (content.getbyte(i) ^ KEY.getbyte(i % KEY.bytesize))
  end

  encrypted.join(",")
end

puts encrypt File.read(ARGV[0])
