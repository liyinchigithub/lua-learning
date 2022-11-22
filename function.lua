#!/usr/local/bin/lua

-- function（函数）
-- 在 Lua 中，函数是被看作是"第一类值（First-Class Value）"，函数可以存在变量里:

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
-- 脚本执行结果为：

    [[$ lua function_test.lua 
120
120]]

-- function 可以以匿名函数（anonymous function）的方式通过参数传递:

-- function_test2.lua 脚本文件   入参是一个表、入参是一个函数
function testFun(tab, fun) --[首字母小写]的全局变量
    for k, v in pairs(tab) do
        print(fun(k, v));
    end
end

tab = { key1 = "val1", key2 = "val2" };
testFun(tab,
    function(key, val) --匿名函数
        return key .. "=" .. val; -- 字符串拼接
    end
);
-- 脚本执行结果为：

--[[
   $ lua function_test2.lua 
    key1 = val1
    key2 = val2 

]]
