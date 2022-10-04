local operations = {
    ["*"] = function(a, b) return a*b end,
    ["/"] = function(a, b) return a/b end,
    ["+"] = function(a, b) return a+b end,
    ["-"] = function(a, b) return a-b end,
    ["^"] = function(a, b) return a^b end
}

--Evaluates the postfix expression expr where val is the value that the variable 'x' takes on
function EvaluatePostfix(expr, val)
    local output = {}

    for i, e in ipairs(expr) do
        if operations[e] then
            local b = table.remove(output)
            local a = table.remove(output)
            output[#output+1] = operations[e](a, b)
        elseif e == "x" then
            output[#output+1] = val
        else
            output[#output+1] = tonumber(e)
        end
    end

    return output[1]
end

function EvaluatePostfixLimit(expr, val)
    local l1 = EvaluatePostfix(expr, val-10^-6)
    local r1 = EvaluatePostfix(expr, val+10^-6)

    local c1 = math.abs(l1-r1)

    local l2 = EvaluatePostfix(expr, val-10^-8)
    local r2 = EvaluatePostfix(expr, val+10^-8)

    local c2 = math.abs(l2-r2)

    if (c2 > c1) then
        print("The limit does not exist")
    else
        local limit = (l2 + r2)/2
        print("The limit as x approaches "..val.." of the expression is "..limit)
    end
end
