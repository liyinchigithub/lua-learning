#!/usr/local/bin/lua

-- 对于全局变量和 table，nil 还有一个"删除"作用，给全局变量或者 table 表里的变量赋一个 nil 值，等同于把它们删掉，执行下面代码就知：

tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end

tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end

-- 不同于其他语言的数组把 0 作为数组的初始索引，在 Lua 里表的默认初始索引一般以 1 开始。


-- 在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表:

-- 创建一个空的 table
local tbl1 = {}
 
-- 直接初始表
local tbl2 = {"apple", "pear", "orange", "grape"}

-- table_test.lua 脚本文件
a = {}
a["key"] = "value"
local key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
    print(k .. " : " .. v)
end

-- key : value
-- 10 : 33

-- table_test2.lua 脚本文件
local tbl = {"apple", "pear", "orange", "grape"}
for key, val in pairs(tbl) do
    print("Key", key)
end

-- table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil

-- table_test3.lua 脚本文件
local a3 = {} --空表
for i = 1, 10 do  --数值循环
    a3[i] = i
end

a3["key"] = "val"
print('a3["key"]',a3["key"])
print('a3["none"]',a3["none"])