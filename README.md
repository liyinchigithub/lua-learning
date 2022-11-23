# lua-learning

### Lua 语言

>是一种轻量小巧的脚本语言，用标准C语言编写并以源代码形式开放， 其设计目的是为了嵌入应用程序中，从而为应用程序提供灵活的扩展和定制功能。

### Lua 特性

* 轻量级: 它用标准C语言编写并以源代码形式开放，编译后仅仅一百余K，可以很方便的嵌入别的程序里。
* 可扩展: Lua提供了非常易于使用的扩展接口和机制：由宿主语言(通常是C或C++)提供这些功能，Lua可以使用它们，就像是本来就内置的功能一样。
* 其它特性:
    * 支持面向过程(procedure-oriented)编程和函数式编程(functional programming)；
    * 自动内存管理；只提供了一种通用类型的表（table），用它可以实现数组，哈希表，集合，对象；
    * 语言内置模式匹配；闭包(closure)；函数也可以看做一个值；提供多线程（协同进程，并非操作系统所支持的线程）支持；
    * 通过闭包和table可以很方便地支持面向对象编程所需要的一些关键机制，比如数据抽象，虚函数，继承和重载等。

### Lua 应用场景

* 游戏开发
* 独立应用脚本
* Web 应用脚本
* 扩展和数据库插件如：MySQL Proxy 和 MySQL WorkBench
* 安全系统，如入侵检测系统

### 第一个 Lua 程序

```lua
print("Hello World!")
```

* 交互式编程模式可以通过命令 
```shell
lua -i 
```


# 1.Lua 环境安装

* Linux 系统上安装

Linux & Mac上安装 Lua 安装非常简单，只需要下载源码包并在终端解压编译即可，本文使用了5.3.0版本进行安装：

```shell
curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar zxf lua-5.3.0.tar.gz
cd lua-5.3.0
make linux test
make install
```

* Mac OS X 系统上安装
```shell
curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar zxf lua-5.3.0.tar.gz
cd lua-5.3.0
make macosx test
make install
```

接下来我们创建一个 HelloWorld.lua 文件，代码如下:
```shell
print("Hello World!")
```

执行以下命令:

```shell
$ lua HelloWorld.lua
```
输出结果为：
Hello World!

* Window 系统上安装 Lua
window 下你可以使用一个叫 "SciTE" 的 IDE环 境来执行 lua 程序，下载地址为：

Github 下载地址：https://github.com/rjpcomputing/luaforwindows/releases

Google Code下载地址 : https://code.google.com/p/luaforwindows/downloads/list

双击安装后即可在该环境下编写 Lua 程序并运行。

你也可以使用 Lua 官方推荐的方法使用 LuaDist：http://luadist.org/


# 2.Lua 数据类型

Lua 是动态类型语言，变量不要类型定义,只需要为变量赋值。 值可以存储在变量中，作为参数传递或结果返回。

Lua 中有 8 个基本类型分别为：nil、boolean、number、string、userdata、function、thread 和 table。

|-|-|
|-|-|
|数据类型|描述|
|nil	|这个最简单，只有值nil属于该类，表示一个无效值（在条件表达式中相当于false）。|
|boolean	|包含两个值：false和true。|
|number	|表示双精度类型的实浮点数|
|string|	字符串由一对双引号或单引号来表示|
|function	|由 C 或 Lua 编写的函数|
|userdata	|表示任意存储在变量中的C数据结构|
|thread	|表示执行的独立线路，用于执行协同程序|
|table	|Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型。在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表|

```lua
print(type("Hello world"))      --> string
print(type(10.4*3))             --> number
print(type(print))              --> function
print(type(type))               --> function
print(type(true))               --> boolean
print(type(nil))                --> nil
print(type(type(X)))            --> string
```

## nil（空）
nil 类型表示一种没有任何有效值，它只有一个值 -- nil，例如打印一个没有赋值的变量，便会输出一个 nil 值：

```lua
print(type(a)) --nil

```

* 对于全局变量和 table，nil 还有一个"删除"作用，给全局变量或者 table 表里的变量赋一个 nil 值，等同于把它们删掉，执行下面代码就知：

```lua
tab1 = { key1 = "val1", key2 = "val2", "val3" }
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
```

```lua
tab1.key1 = nil
for k, v in pairs(tab1) do
    print(k .. " - " .. v)
end
```

* nil 作比较时应该加上双引号 "

```lua
> type(X)
nil
> type(X)==nil
false
> type(X)=="nil"
true
>
```

type(X)==nil 结果为 false 的原因是 type(X) 实质是返回的 "nil" 字符串，是一个 string 类型：

```lua
type(type(X))==string
```


## boolean（布尔）
>boolean 类型只有两个可选值：true（真） 和 false（假）

>Lua 把 false 和 nil 看作是 false

>其他的都为 true，数字 0 也是 true:

实例

```lua
print(type(true))
print(type(false))
print(type(nil))
 
if false or nil then
    print("至少有一个是 true")
else
    print("false 和 nil 都为 false")
end

if 0 then
    print("数字 0 是 true")
else
    print("数字 0 为 false")
end

```

## number（数字）

Lua 默认只有一种 number 类型 -- double（双精度）类型（默认类型可以修改 luaconf.h 里的定义），以下几种写法都被看作是 number 类型：

```lua
print(type(2))
print(type(2.2))
print(type(0.2))
print(type(2e+1))
print(type(0.2e-1))
print(type(7.8263692594256e-06))
```

## string（字符串）
字符串由一对双引号或单引号来表示。

```lua
string1 = "this is string1"
string2 = 'this is string2'
```

也可以用 2 个方括号 "[[]]" 来表示"一块"字符串。

```lua
html = [[
<html>
<head></head>
<body>
    <a href="http://www.runoob.com/">菜鸟教程</a>
</body>
</html>
]]
print(html)
```

* 字符串连接

```lua
print("a" .. 'b')   --ab

print(157 .. 428)   --157428

```


* 使用 # 来计算字符串的长度，放在字符串前面

```lua
local len = "www.runoob.com"
print(#len) --14
print(#"www.runoob.com") --14
```

## table（表）
在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表:

实例

-- 创建一个空的 table
```lua
local tbl1 = {}
```
 
-- 直接初始表
local tbl2 = {"apple", "pear", "orange", "grape"}
Lua 中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字或者是字符串。

实例
-- table_test.lua 脚本文件
```lua
a = {}

a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11

for k, v in pairs(a) do
    print(k .. " : " .. v)
end

-- key : value
-- 10 : 33
```

>不同于其他语言的数组把 0 作为数组的初始索引，在 Lua 里表的默认初始索引一般以 1 开始。


## function（函数）
在 Lua 中，函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里:

实例
```lua
-- function_test.lua 脚本文件
function factorial1(n)
    if n == 0 then
        return 1
    else
        return n * factorial1(n - 1)
    end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(5))
```

脚本执行结果为：
```lua
$ lua function_test.lua 
120
120
function 可以以匿名函数（anonymous function）的方式通过参数传递:
```


实例
```lua
-- function_test2.lua 脚本文件
function testFun(tab,fun)
        for k ,v in pairs(tab) do
                print(fun(k,v));
        end
end

tab={key1="val1",key2="val2"};
testFun(tab,
function(key,val)--匿名函数
        return key.."="..val;
end
);
```

脚本执行结果为：
```lua
$ lua function_test2.lua 
key1 = val1
key2 = val2

```

* 可以将函数作为参数传递给函数，如下实例：

```lua
myprint = function(param)
   print("这是打印函数 -   ##",param,"##")
end

function add(num1,num2,functionPrint)
   result = num1 + num2
   -- 调用传递的函数参数
   functionPrint(result)
end

myprint(10)

-- myprint 函数作为参数传递
add(2,5,myprint)
```

* 多返回值    Lua函数可以返回多个结果值，比如string.find，其返回匹配串"开始和结束的下标"（如果不存在匹配串返回nil）。
```lua
function maximum (a)
    local mi = 1             -- 最大值索引
    local m = a[mi]          -- 最大值
    for i,val in ipairs(a) do
       if val > m then
           mi = i
           m = val
       end
    end
    return m, mi -- 返回2个参数
end

print(maximum({8,10,23,12,5}))
```

* 可变参数  Lua 函数可以接受可变数目的参数，和 C 语言类似，在函数参数列表中使用三点 ... 表示函数有可变的参数。

```lua
function add(...)  
local s = 0  
  for i, v in ipairs{...} do   --> {...} 表示一个由所有变长参数构成的数组  
    s = s + v  
  end  
  return s  
end  
print(add(3,4,5,6,7))  --->25
```

* 可以将可变参数赋值给一个变量。

```lua
function average(...)
   result = 0
   local arg={...}    --> arg 为一个表，局部变量
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. #arg .. " 个数")
   return result/#arg
end

print("平均值为",average(10,5,3,4,5,6))
```

* 也可以通过 select("#",...) 来获取可变参数的数量:
```lua
function average(...)
   result = 0
   local arg={...}
   for i,v in ipairs(arg) do
      result = result + v
   end
   print("总共传入 " .. select("#",...) .. " 个数")
   return result/select("#",...)
end

print("平均值为",average(10,5,3,4,5,6))
```


* 有时候我们可能需要几个固定参数加上可变参数，固定参数必须放在变长参数之前
```lua
function fwrite(fmt, ...)  ---> 固定的参数fmt
    return io.write(string.format(fmt, ...))    
end

fwrite("runoob\n")       --->fmt = "runoob", 没有变长参数。  
fwrite("%d%d\n", 1, 2)   --->fmt = "%d%d", 变长参数为 1 和 2
```

* 通常在遍历变长参数的时候只需要使用 {…}，然而变长参数可能会包含一些 nil，那么就可以用 select 函数来访问变长参数了：select('#', …) 或者 select(n, …)

select('#', …) 返回可变参数的长度。
select(n, …) 用于返回从起点 n 开始到结束位置的所有参数列表。
调用 select 时，必须传入一个固定实参 selector(选择开关) 和一系列变长参数。如果 selector 为数字 n，那么 select 返回参数列表中从索引 n 开始到结束位置的所有参数列表，否则只能为字符串 #，这样 select 返回变长参数的总数。

```lua
function f(...)
    a = select(3,...)  -->从第三个位置开始，变量 a 对应右边变量列表的第一个参数
    print (a)
    print (select(3,...)) -->打印所有列表参数
end

f(0,1,2,3,4,5)
--[[
2
2       3       4       5
]]
```

do  
    function foo(...)  
        for i = 1, select('#', ...) do  -->获取参数总数
            local arg = select(i, ...); -->读取参数，arg 对应的是右边变量列表的第一个参数
            print("arg", arg);  
        end  
    end  
 
    foo(1, 2, 3, 4);  
end

## 条件

Lua if 语句可以与 else 语句搭配使用, 在 if 条件表达式为 false 时执行 else 语句代码块。

```lua
if(布尔表达式)
then
   --[ 布尔表达式为 true 时执行该语句块 --]
else
   --[ 布尔表达式为 false 时执行该语句块 --]
end
```

```lua
--[ 定义变量 --]
a = 100;
--[ 检查条件 --]
if( a < 20 )
then
   --[ if 条件为 true 时执行该语句块 --]
   print("a 小于 20" )
else
   --[ if 条件为 false 时执行该语句块 --]
   print("a 大于 20" )
end
print("a 的值为 :", a)
```

if elseif else
```lua
--[ 定义变量 --]
a = 100

--[ 检查布尔条件 --]
if( a == 10 )
then
   --[ 如果条件为 true 打印以下信息 --]
   print("a 的值为 10" )
elseif( a == 20 )
then  
   --[ if else if 条件为 true 时打印以下信息 --]
   print("a 的值为 20" )
elseif( a == 30 )
then
   --[ if else if condition 条件为 true 时打印以下信息 --]
   print("a 的值为 30" )
else
   --[ 以上条件语句没有一个为 true 时打印以下信息 --]
   print("没有匹配 a 的值" )
end
print("a 的真实值为: ", a )
```


##
```lua
```
## 
```lua
```

##
```lua
```


##
```lua
```


##
```lua
```


##
```lua
```


##
```lua
```


##
```lua
```


# Lua常用函数

##
```lua
string.upper(argument):
-- 字符串全部转为大写字母。
string.lower(argument):
-- 字符串全部转为小写字母。
string.gsub(mainString,findString,replaceString,num)
-- 在字符串中替换。
-- mainString 为要操作的字符串， findString 为被替换的字符，replaceString 要替换的字符，num 替换次数（可以忽略，则全部替换），如：
> string.gsub("aaaa","a","z",3);zzza   
string.find (str, substr, [init, [plain]])
-- 在一个指定的目标字符串 str 中搜索指定的内容 substr，如果找到了一个匹配的子串，就会返回这个子串的起始索引和结束索引，不存在则返回 nil。

-- init 指定了搜索的起始位置，默认为 1，可以一个负数，表示从后往前数的字符个数。

-- plain 表示是否使用简单模式，默认为 false，true 只做简单的查找子串的操作，false 表示使用使用正则模式匹配。

以下实例查找字符串 "Lua" 的起始索引和结束索引位置：

> string.find("Hello Lua user", "Lua", 1) 

string.reverse(arg)
字符串反转

> string.reverse("Lua") auL
string.format(...)

返回一个类似printf的格式化字符串
> string.format("the value is:%d",4)

the value is:4

string.char(arg) 和 string.byte(arg[,int])

-- char 将整型数字转成字符并连接， byte 转换字符为整数值(可以指定某个字符，默认第一个字符)。

> string.char(97,98,99,100) --abcd

> string.byte("ABCD",4) --68

> string.byte("ABCD") --65

>
string.len(arg)

-- 计算字符串长度。
string.len("abc")

string.rep(string, n)
-- 返回字符串string的n个拷贝

> string.rep("abcd",2) --abcdabcd

-- 链接两个字符串
> print("www.runoob.".."com") --www.runoob.com
string.gmatch(str, pattern)
-- 返回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果参数 pattern 描述的字符串没有找到，迭代函数返回nil。

> for word in string.gmatch("Hello Lua user", "%a+") do print(word) end
Hello
Lua
user

string.match(str, pattern, init)
string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1。
在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。
> = string.match("I have 2 questions for you.", "%d+ %a+") --questions

> = string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)"))
2, "questions"
```

##
```lua
```

##
```lua
```

##
```lua
```

##
```lua
```

##
```lua
```