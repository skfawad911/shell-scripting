#!/bin/bash

num=1
while [[ $(($num % 2)) == 0 && $num -le 10 ]]
do
	    echo $num
	    ((num++))
	done

