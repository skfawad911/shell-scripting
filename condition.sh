#!/bin/bash

<<comment
read -p "Enter your Age" age

if [[ $age -le 13 ]]; 
then
	echo "You are a Minor"
elif [[ $age -ge 16 && $age -lt 18 ]]; 
then
	echo "You are an Teenager"
elif [[ $age -ge 18 ]]; 
then 
	echo "You are Adult"
else
	echo "Enter a Valid Age"
fi





read -p "Enter: " bandi
read -p "Enter Number: " pyar

if [[ $bandi == "daya" ]];
then
	echo "loyal"
elif [[ $pyar -ge 100 ]];
then
	echo "loyal"
else 
	echo "dhokebaaz"
fi

comment

read -p "Enter a Day: " Day
case "$Day" in
	Monday)
		echo "Its Work Day"
		;;
	Tuesday)
		echo "its travelling Day"
		;;
	Friday)
		echo "Its funday"
		;;
	Sunday)
		echo "Its Holiday"
		;;
	*)
		echo "Please Enter a Proper Day"
		;;
esac





