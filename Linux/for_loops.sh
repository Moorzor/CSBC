#!/bin/bash

#Variables
states=('Nebraska' 'California' 'Texas' 'Hawaii' 'Washington')
nums=$(echo {0..9})
ls_out=$(ls)
suid=$(find / -type f =perm 2> /dev/null)

# Create for Loops
# Create a loop that looks for Washington
for state in ${states[@]};
do
      if [ $state == 'Washington' ]
      then
         echo "Washington is the best"
      else
         echo "I'm not a fan of $state"
       fi
     done




#Create a loop that prints only 3, 5, and 7
for num in ${nums[@]};
do
     if [ $num = 3 ] || [ $num =5 ] || [ $num =7 ]
     then
        echo $num
      fi
    done



for x in ${ls_out[@]};
do 
   echo $x
done
