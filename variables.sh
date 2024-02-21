#!/bin/bash


name="Fawad"

echo "Your Name is: "$name + " Current date is $(date)"


num1=7
num2="hi"
num3="5"
echo "result is of $num1+$num2+$num3 is "$((num1+num2+num3))


#!/bin/bash

num1=7
num2="hi"
num3="5"
result="$num1$num2$num3"
echo "result of $num1 + $num2 + $num3 is $result"

greet="Good Morning!!"

echo $greet,$USER
