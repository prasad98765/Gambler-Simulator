#!/bin/bash -x

echo "Welcome : To Gambler Simulator "

#constant
BET=1

#variable
totalwin=0
totalloose=0

declare -A dictWinLoose
function dailyPlay()
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

		totalwin=$win
		totalloose=$loose
		difference=$(($win - $loose))
		dictWinloose[$i]=$difference 
      if [[ $difference -eq 50 ]]
      then
        echo "day$i"  $difference
      else
        echo "day$i"  $difference
      fi
	done

echo "Total Win" $totalwin
echo "Total loose" $totalloose

}

main()
{
dailyPlay
}

main
