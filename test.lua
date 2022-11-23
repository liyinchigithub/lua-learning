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


-- 99乘法表
a=9
b=9
for i = 1, a, 1 do
    for j = 1, b, 1 do
        print(i.."x"..j..'='..i*j)
    end
    print('\n')
end

--表
tab={name1="张三",name2="李四",name3="王五",name4="赵六"}

for key, value in pairs(tab) do
    print(key..'-----'..value)
end

tab2={1,2,3,4,5}
for key, value in pairs(tab2) do
    print(key..'-----'..value)
    
end

tab3={}

tab3[1]='小梅'
tab3[2]='小红'
tab3[3]='小明'
tab3["vip"]='小刚'

for key, value in pairs(tab3) do
    print(key..'--'..value)
end

--表.属性
print("tab.name1:"..tab.name1)


--条件
a=1
b=2
if (a<b) then
    print(a..'小于'..b)
end

a=10
b=2
if (a<b) then
    -- body
    print(a..'小于'..b)
else
    -- body
    print(a..'大'..b)
end