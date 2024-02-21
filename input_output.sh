#!/bin/bash

echo "Enter username"
read username

echo "hey, $username welcome to the world of bash"


read -p "Enter Your FirstName and LastName: " first_name last_name
echo "Mr. $first_name $last_name be ready things are about to get heavy!!!"


read -p "Enter Your Age: " age
echo "Well $age, You are too young for this!!"


echo -e "\e[1;31mError:\e[0m Age not valid."

printf "Name: %-10s \t Age: %d\n" "$username" "$age"


