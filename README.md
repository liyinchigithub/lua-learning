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