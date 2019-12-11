
#!/bin/bash -x

echo "Welcome : To Gambler Simulator "

#constant
BET=1


#variable
win=0
loose=0

declare -A dictWinLoose
function dailyPlay()
{

	echo "Days Wins Loose amount"
	for (( i=1; i<=20; i++ ))
	do
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
		dictWinloose[$i]=$win" "$loose
		echo "day$i" "$stake"
	done
		echo "Win count"  $win
		echo "Loose count"  $loose

}

dailyPlay
