#while [ 1 -lt 2 ];do

echo "enter the number"
read num

if [ $num -eq -1 ];then
break
fi

echo "$num" >> numbers

#done

sort -n numbers


