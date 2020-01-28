#!/bin/bash  
#welcome text of gambler
echo "Welcome Gambling Simulation"

#CONSTANTS
STAKE=100
BET=1

#calculate percentage
Percentage=$(( STAKE * 50 / 100 ))

#VARIABLE
UpperCash=$(( STAKE + Percentage ))
LowerCash=$(( STAKE - Percentage ))
cash=$STAKE

declare -A	winlooseDict
#function to check win or loose gambler
function GamblerBet()
{
	while [[ $cash -lt $UpperCash && $cash -gt $LowerCash ]]
	do
		if [[ $((RANDOM%2)) -eq 1 ]]
		then
			((cash++))
		else
			((cash--))
		fi
	done
	CurrentAmount=$((cash - STAKE))
	echo $CurrentAmount
}

echo "Pull Amount:$PullAmount"
#total amount  of win and loose
function total_Monthly_amount()
{
	for ((day=1; day<=20; day++))
	do 
			winlooseDict[Day$day]=$(GamblerBet)
			totalAmount=$(($totalAmount + ${winlooseDict[Day$day]}))
			echo  "Day :$day" ${winlooseDict[Day$day]}
	done
	if [[ $totalAmount -gt 0 ]]
	then
		echo "Winner Count is : $totalAmount"
	else
		echo "Looser Count is : $totalAmount"
	fi

}

#calling function 
total_Monthly_amount



