key = 'i hope in the next ten years there would be no other farewell letter brilliant than this one';

fs = require('fs');
fs.readFile process.argv[2], (err, data) ->
  encrypted = data.toString().replace(/\s/g, '').split(',')
  decrypted = (String.fromCharCode(parseInt(encrypted[i]) ^ key.charCodeAt(i % key.length)) for i in [0 ... encrypted.length])
  process.stdout.write(decrypted.join(''))
