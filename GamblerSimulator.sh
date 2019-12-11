#!/bin/bash -x

echo "Welcome : To Gambler Simulator "

#constant
BET=1

#variable
stack=100
win=0
loose=0
lowerlimit=$(( $stack / 2 ))
upperlimit=$(( $stack + $stack / 2 ))

function dailyPlay()
{
while (( $lowerlimit < $stack && $upperlimit > $stack ))
do
	result=$((RANDOM%2))
	if [[ $result -eq 1 ]]
	then
		((stack++))
		((win++))
	else
		((stack--))
		((loose++))
	fi
done
echo $stack
echo $win
echo $loose
}


main()
{
  dailyPlay
}
main
