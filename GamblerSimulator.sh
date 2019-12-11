==#!/bin/bash -x

echo "Welcome : To Gambler Simulator "

#constant
BET=1

#variable
totalDiff=0

declare -A dictWinLoose
function gamblePlay()
{

	echo "Days Wins"
	for (( i=1; i<=30; i++ ))
	do
		win=0
		loose=0
		stake=100
    	lowerlimit=$(( $stake / 2 ))
		upperlimit=$(( $stake + $stake / 2 ))

		while (( $lowerlimit < $stake && $upperlimit > $stake ))
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

		winlooseDifference=$(($win - $loose))
		totalDiff=$(($totalDiff + $winlooseDifference ))
		dictWinloose[$i]="$winlooseDifference  $totalDiff"
	done

}

function luckiest()
{
	echo "luckiest day and amount: "
	for (( i=1; i<=30; i++ ))
	do
			echo "day$i" ${dictWinloose[$i]}
	done | sort -rn -k3 | head -1
}

function unluckiest()
{
	echo "unluckiest day and amount: "
	for (( j=1; j<=30; j++ ))
	do
		echo "day$j" ${dictWinloose[$j]}
	done | sort -k3 -n | head -1
}

function main()
{
gamblePlay
luckiest
unluckiest
}
main
