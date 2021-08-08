

echo "enter a num"
read num

if [ $num -gt 100 ];then
   echo "$num is greater than 100 "
elif [ $num -lt 100 ];then
	echo "$num is less than 100"
else
	echo "$num is 100"
fi
