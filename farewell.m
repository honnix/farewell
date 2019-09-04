#!/usr/bin/env octave -q

key = int32('i hope in the next ten years there would be no other farewell letter brilliant than this one')';

fid = fopen(argv(){1});
content = strsplit(fscanf(fid, '%s'), ',');
[r, c] = size(content);
encrypted = zeros(c, 1);
for i = 1:c
  encrypted(i) = str2num(content{1, i});
endfor

printf('%s', char(bitxor(encrypted, repmat(key, ceil(c / size(key)(1)) + 1, 1)(1:c)))');
