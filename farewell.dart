import 'dart:io';
import 'dart:async';
import 'dart:convert';

void main(List<String> arguments) async {
  var key = 'i hope in the next ten years there would be no other farewell letter brilliant than this one';
  var data = await (new File(arguments[0]).readAsString(encoding: ASCII));
  var encrypted = data.replaceAll(new RegExp(r'\s'), '').split(',');
  var decrypted = new List<int>();
  for (int i = 0; i < encrypted.length; ++i) {
    decrypted.add(int.parse(encrypted[i]) ^ key.codeUnitAt(i % key.length));
  }
  stdout.write(UTF8.decode(decrypted));
}
