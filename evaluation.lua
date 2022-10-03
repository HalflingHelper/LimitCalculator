local operations = {
    ["*"] = function(a, b) return a*b end,
    ["/"] = function(a, b) return a/b end,
    ["+"] = function(a, b) return a+b end,
    ["-"] = function(a, b) return a-b end,
}

--Evaluates the postfix expression expr where val is the value that the variable 'x' takes on
function EvaluatePostfix(expr, val)
    if #expr == 1 then
        return expr[1]
    end

    local output = {}

    for i, e in ipairs(expr) do
        if operations[e] then
            local b = table.remove(output)
            local a = table.remove(output)
            output[#output+1] = operations[e](a, b)
        elseif val == "x" then
            output[#output+1] = val
        else
            output[#output+1] = tonumber(e)
        end
    end

    return EvaluatePostfix(output, val)
end
