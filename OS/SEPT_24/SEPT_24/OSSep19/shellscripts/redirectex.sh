


x=0
until [ $x -gt 5 ];do
echo "enter number and name"
read jn name

echo "$jn $name" >> players

((x=x+1))

done

