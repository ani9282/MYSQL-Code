echo "enter 3 numbers"
read x y z

#use expr command in a statement use backtic `
#sum=`expr $x + $y + $z`
((sum=x+y+z))

echo "$x+$y+$z=$sum"
