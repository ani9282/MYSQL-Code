

echo "enter a string"
read str


len=`echo "$str" | wc -c`
((len=len-1))
i=1
while [ $i -le $len ]
do
 echo "$str" | cut -c $i

((i=i+1))

done

