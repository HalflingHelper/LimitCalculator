--Takes an input string that is an infix expression, and parses it into postfix
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
        elseif IsOperator(e) then
            --Right now we're only worried about * and / being more important than + and -
            if e == "*" or e=="/" then
                table.insert(stack, e)
            else
                while stack[#stack] == "*" or stack[#stack] == "/" do
                    output[#output+1] = table.remove(stack)
                end
                table.insert(stack, e)
            end
        else --Number or variable
            output[#output+1] = e
        end
    end

    while #stack > 0 do
        output[#output+1] = table.remove(stack)
    end

    return output
end

function ParseElements(str)
    local expr = {}
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
    local operators = {"+", "-", "*", "/", "(", ")"}
    for _, o in ipairs(operators) do
        if c == o then
            return true
        end
    end

    return false
end