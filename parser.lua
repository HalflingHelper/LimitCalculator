local BINARY_LEFT = 1
local BINARY_RIGHT = 2
local UNARY_PRE = 3
local UNARY_POST = 4

local operators = {
    ["*"] = {priority=2, type=BINARY_LEFT},
    ["/"] = {priority=2, type=BINARY_LEFT},
    ["+"] = {priority=3, type=BINARY_LEFT},
    ["-"] = {priority=3, type=BINARY_LEFT},
    ["^"] = {priority=1, type=BINARY_RIGHT},
    ["!"] = {priority=0, type=UNARY_POST},
}

--Better, but still no function tokens
function InfixtoPostfix(str)
    local expr = ParseElements(str)

    local output = {}
    local stack = {}

    for i, e in ipairs(expr) do
        if e == "(" then
            table.insert(stack, e)
        elseif e == ")" then
            while stack[#stack] ~= "(" do
                output[#output+1] = table.remove(stack)
            end
            table.remove(stack)
        elseif operators[e] then
            if operators[e].type==BINARY_LEFT then
                while operators[stack[#stack]] and operators[stack[#stack]].priority <= operators[e].priority do
                    output[#output+1] = table.remove(stack)
                end

                stack[#stack+1] = e
            elseif operators[e].type == BINARY_RIGHT then
                while operators[stack[#stack]] and operators[stack[#stack]].priority < operators[e].priority do
                    output[#output+1] = table.remove(stack)
                end

                stack[#stack+1] = e
            elseif operators[e].type == UNARY_POST then
                output[#output+1] = e
            end
        else --Operand
            output[#output+1] = e
        end
    end

    while #stack > 0 do
        output[#output+1] = table.remove(stack)
    end

    return output
end

--Parses the string into tokens that include numbers, brackets, and operators
function ParseElements(str)
    local expr = {''}
    --Convert string into a table of each entity
    for i = 1, #str do
        local c = string.sub(str, i, i)
        if c == ' ' then
            expr[#expr + 1] = ''
        
        elseif IsOperator(c) then
            if expr[#expr] == '' then
                expr[#expr] = c
            else
                expr[#expr + 1] = c
            end
            expr[#expr + 1] = ''
        else --It's a number or a variable
            expr[#expr] = expr[#expr] .. c
        end
    end

    if expr[#expr] == '' then
        table.remove(expr)
    end

    return expr
end


function IsOperator(c)
    local operators = {"+", "-", "*", "/", "^", "(", ")"}
    for _, o in ipairs(operators) do
        if c == o then
            return true
        end
    end

    return false
end