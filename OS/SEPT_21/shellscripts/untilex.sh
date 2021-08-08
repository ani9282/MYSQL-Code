

x=1
#loop executes as long as the condition is false
until [ $x -gt 100 ] 
do
 echo "$x"
 ((x=x+1))
done 
