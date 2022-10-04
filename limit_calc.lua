require 'parser'
require 'evaluation'

--Receive user input for the expression in terms of x'
print("Enter an expression in terms of x.")
print("Please only use numbers and the following operators (),*,/,+,-")
local expr = io.read()

--Convert expression to a postfix notation table
local postfixExpr = InfixtoPostfix(expr)

--Receive user input for whatever the limit is
print("Enter the value at which to evaluate the limit:")
local n = tonumber(io.read())

--Evaluate the limit
EvaluatePostfixLimit(postfixExpr, n)
