#!/usr/local/bin/lua

-- 字符串

--[[
单引号间的一串字符。
双引号间的一串字符。
--]]

local string1 = "this is string1"
local string2 = 'this is string2'

print(string1)
print(string2)


local html = [[
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html>
]]
print('html:'..html)


-- 在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字:

print("2" + 6) --8.0

print("2" + "6") --8.0

print("2 + 6") --2 + 6

print("-2e2" * "6") -- -1200.0

-- print("error" + 1) --报错 字符串连接使用的是 ..


-- 使用 # 来计算字符串的长度，放在字符串前面

local len = "www.runoob.com"
print(#len) --14
print(#"www.runoob.com") --14

-- 字符串拼接
print('a'..'b') --ab