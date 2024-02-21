#!/bin/bash
<< comment
print_hello(){
	echo "Hello"
}

print_hello

comment

get_sum(){
	sum=$(($1+$2))
	return $sum
}

get_sum $1 $2
result=$?
echo "Sum: $result"

