#!/bin/bash -x

echo "Welcome : To Gambler Simulator "

STAKE=100
BET=1
WINS=0

result=$((RANDOM%2))
if [[ $result -eq 1 ]]
then
	echo "Win"
	WINS=$(($WINS + 1))
else
	echo "loose"
	WINS=$(($WINS - 0))
fi

