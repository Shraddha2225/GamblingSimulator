#!/bin/bash -x
#welcome text of gambler
echo "Welcome Gambling Simulation"

#CONSTANTS
STAKE=100
BET=1

function bet()
{
	result=$((RANDOM%2))
	if [[ result -eq 1 ]]
	then
		echo "Win"
	else
		echo "Loose"
	fi
}

#calling bet function here
bet
