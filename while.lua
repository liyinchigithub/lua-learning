#!/usr/local/bin/lua

-- 循环
--[[
while 循环	在条件为 true 时，让程序重复地执行某些语句。执行语句前会先检查条件是否为 true。
for 循环	重复执行指定语句，重复次数可在 for 语句中控制。
repeat...until	重复执行循环，直到 指定的条件为真时为止
循环嵌套	可以在循环内嵌套一个或多个循环语句（while do ... end;for ... do ... end;repeat ... until;）    
--]]

-- while
a=10
while( a < 20 )
do
   print("a 的值为:", a)
   a = a+1
end

-- for

--[[
数值for循环
]]

function f(x)  
    print("function")  
    return x*2  
end  
for i=1,f(5) do print(i)  
end


--[[
泛型for循环
]]
a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end 

days = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}  
for i,v in ipairs(days) do  print(v) end  


-- repeat...until 循环

--[ 变量定义 --]
a = 10
--[ 执行循环 --]
repeat
   print("a的值为:", a)
   a = a + 1
until( a > 15 )
-- repeat...until 循环语句不同于 for 和 while循环，for 和 while 循环的条件语句在当前循环执行开始时判断，而 repeat...until 循环的条件语句在当前循环结束后判断。
-- 相当于do while 先执行一次循环再判断


--[[循环嵌套    Lua 编程语言中 for 循环嵌套语法格式:

for init,max/min value, increment
do
   for init,max/min value, increment
   do
      statements
   end
   statements
end

--]]


--[[循环嵌套    Lua 编程语言中 while 循环嵌套语法格式:

while(condition)
do
   while(condition)
   do
      statements
   end
   statements
end

--]]

--[[循环嵌套    Lua 编程语言中 repeat...until 循环嵌套语法格式:

repeat
   statements
   repeat
      statements
   until( condition )
until( condition )

除了以上同类型循环嵌套外，我们还可以使用不同的循环类型来嵌套，如 for 循环体中嵌套 while 循环。
--]]

jj =2
for ii=2,10 do     --没有步长，默认步长为1
   for jj=2,(ii/jj) , 2 do
      if(not(ii%jj))
      then
         break
      end
      if(jj > (ii/jj))then
         print("i 的值为：",i)
      end
   end
end


--[[
循环控制语句
循环控制语句用于控制程序的流程， 以实现程序的各种结构方式。

Lua 支持以下循环控制语句：

控制语句	描述
break 语句	退出当前循环或语句，并开始脚本执行紧接着的语句。
goto 语句	将程序的控制点转移到一个标签处。

]]


-- 无限循环
-- 在循环体中如果条件永远为 true 循环语句就会永远执行下去，以下以 while 循环为例：

while( true )
do
   print("循环将永远执行下去")
end


