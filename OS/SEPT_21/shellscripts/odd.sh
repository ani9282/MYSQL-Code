
echo "enter a number"
read num

rem=`expr $num % 2`

if [ $rem -eq 0 ]   #other binary operators -ne, -ge,-gt,-le,-lt
then
  echo "$num is even"
else
  echo "$num is odd"
fi


