
x=1
#loop executes as long as the condition is true
while [ $x -le 100 ]
do
  echo "$x"
  ((x=x+1))
done 
