

echo "enter a filename"
read fn

# unary operator = it works with a single operand
# other unary operators are  -d , -z 
if [ -f $fn ] 
then
	cat $fn
elif [ -d $fn ]
then
	ls $fn
else
	echo "$fn does not exist"
fi

