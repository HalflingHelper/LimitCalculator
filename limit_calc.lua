require 'parser'
require 'evaluation'

--Receive user input for the expression in terms of x'
print("Enter an expression in terms of x.")
print("Please only use numbers and the following operators (),*,/,+,-")
local expr = io.read()


--Convert expression to a postfix notation table
local postfixExpr = InfixtoPostfix(expr)

--https://www.chris-j.co.uk/parsing.php

--Receive user input for whatever the limit is
print("Enter the value at which to evaluate the limit:")
local n = io.read().tonumber()

--Evaluate the limit
    --Try to straight up evaluate at the limit
    --If there is an error
        --Evaluate from either side
            --Approximate derivative at the each side of the point
            --Take the average of the two estimates
            --Get closer and closer until estimates converge?