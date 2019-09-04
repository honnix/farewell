#!/usr/bin/env lua

-- copied from http://lua-users.org/wiki/SplitJoin
function split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
	 table.insert(t,cap)
      end
      last_end = e + 1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end
   return t
end
------------------------------------------------

-- copied from http://lua-users.org/wiki/BitUtils
function xor(a, b)
   pow = 1
   c = 0
   while a > 0 or b > 0 do
      c = c + (XOR_l[(a % 2) + 1][(b % 2) + 1] * pow)
      a = math.floor(a / 2)
      b = math.floor(b / 2)
      pow = pow * 2
   end
   return c
end

XOR_l =
{ 
   {0,1},
   {1,0},
}
------------------------------------------------

file = io.open(arg[1], "r")
content = file:read("*a")
file:close()

encrypted = split(string.gsub(content, "%s", ""), ",")
key = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

decrypted = {}
for i = 1, #encrypted do
   table.insert(decrypted, string.char(xor(tonumber(encrypted[i]), key:byte((i - 1) % #key + 1))))
end
io.write(table.concat(decrypted, ""))
