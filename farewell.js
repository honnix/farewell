var key = 'i hope in the next ten years there would be no other farewell letter brilliant than this one';

var fs = require('fs');
fs.readFile(process.argv[2], function (err, data) {
  var encrypted = data.toString().replace(/\s/g, '').split(',');
  var decrypted = '';
  for (var i = 0; i < encrypted.length; ++i) {
    decrypted += '%' + ('0' + (parseInt(encrypted[i]) ^ key.charCodeAt(i % key.length)).toString(16)).slice(-2);
  }
  process.stdout.write(decodeURIComponent(decrypted));
});
