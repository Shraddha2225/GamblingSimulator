#!/bin/bash 
#welcome text of gambler
echo "Welcome Gambling Simulation"

#CONSTANTS
STAKE=100
BET=1

#calculate percentage
PERCENTAGE=$(( STAKE * 50 / 100 ))

UpperCash=$(( STAKE +  PERCENTAGE ))
LowerCash=$(( STAKE - PERCENTAGE ))
CASH=$STAKE

#function to check win or loose gambler
function bet()
{
	while [[ $CASH -lt UpperCash && $CASH -gt LowerCash ]]
	do
		result=$((RANDOM%2))
		if [[ result -eq 1 ]]
		then
			((CASH++))
			echo "Win : $CASH"
		else
			((CASH--))
			echo "Loose : $CASH"
		fi
	done
}

#calling bet function here
bet
echo "Total Days = $CASH"


