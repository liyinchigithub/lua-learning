#!/usr/local/bin/lua

print("Hello World！")
print("www.runoob.com")

--单行注释

--[[
 多行注释
 多行注释
 --]]

-- 全局变量 
a=5
print(a)
print(b)
-- 全局变量不需要声明，给一个变量赋值后即创建了这个全局变量，访问一个没有初始化的全局变量也不会出错，只不过得到的结果是：nil

-- 删除一个全局变量
c= nil --删除一个全局变量，只需要将变量赋值为nil
print(c)
-- 局部变量
local d= 10
print(d)

-- 数据类型

print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string

