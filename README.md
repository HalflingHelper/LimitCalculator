# Limit Calculator
 A simple limit calculator written in pure lua

# Why?
 This problem caught my eye when browsing [this list of project ideas](https://github.com/karan/Projects-Solutions). It seemed like an interesting problem, and there was only one existing solution, that only supported polynomial expressions. [This great post](https://www.chris-j.co.uk/parsing.php) was extremely helpful for me in getting some form of parsing working for user input, and although the calculator currently only supports basic operations, I hope that I can extend it to cover some slightly more complex math, as well as adding support for infinite limits.

# What do I still need to do?
 I want to extend parsing to apply to both negative and decimal numbers. For now you have to use (0-n) in place of negative numbers, and (a/b) in place of any decimal numbers. There is also no programmatic input checking, so if you input something wrong, the program could explode in your face.

# How do I run it?
 If for some reason you want to run this project on your computer, you need to have a lua binary installed, and then you can simply run `lua limit_calc.lua` in the terminal.
