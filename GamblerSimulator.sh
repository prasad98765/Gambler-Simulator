#!/bin/bash -x

echo "Welcome : To Gambler Simulator "

#variable
totalDiff=0

declare -A dictWinLoose
function gamblerPlay()
{
	for (( i=1; i<=30; i++ ))
	do
		win=0
		loose=0
		stake=100
	    	lowerLimit=$(( $stake / 2 ))
		upperLimit=$(( $stake + $stake / 2 ))
		while (( $lowerLimit < $stake && $upperLimit > $stake ))
		do
			result=$((RANDOM%2))
			if [[ $result -eq 1 ]]
			then
				((stake++))
				((win++))
			else
				((stake--))
				((loose++))
			fi
		done
		winLooseDifference=$(($win - $loose))
		totalDiff=$(($totalDiff + $winLooseDifference ))
		dictWinloose[$i]="$winLooseDifference  $totalDiff"
	done
}

function nextMonth()
{
	if [ $winLooseDifference -gt 0 ]
	then
		main
	else
		echo "No Money Left"
	fi
}

function luckiest()
{
	echo "luckiest day and by amount is : "
	for (( i=1; i<=30; i++ ))
	do
		echo "day$i" ${dictWinloose[$i]}

	done | sort -rn -k3 | head -1 
}

function unluckiest()
{
	echo "unluckiest day and by amount is : "
	for (( j=1; j<=30; j++ ))
	do
		echo "day$j" ${dictWinloose[$j]}

	done | sort -k3 -n | head -1
}

function main()
{
gamblerPlay
luckiest
unluckiest
nextMonth
}

main
