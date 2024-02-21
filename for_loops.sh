#!/bin/bash


<< comment
#for loops for creating directories

for (( i=1 ; i<=5 ; i++ ));
do
	mkdir "Day$i"
done

echo "Created 5 directories....."


# removing

for (( i=1;i<=5;i++));
do
	rmdir "Day$i"
done

comment

for i in {1..5}
do
	echo "Iteration $i"
done



