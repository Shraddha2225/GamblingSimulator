#!/bin/bash -x
#welcome text of gambler
echo "Welcome Gambling Simulation"

#CONSTANTS
STAKE=100
BET=1


#calculate percentage
Percentage=$(( STAKE * 50 / 100 ))

uppercash=$(( STAKE + Percentage ))
lowercash=$(( STAKE - Percentage ))
cash=$STAKE

#declare -A	DictWinLoose
#function to check win or loose gambler
function bet()
{
	while [[ $cash -lt uppercash && $cash -gt lowercash ]]
	do
		result=$((RANDOM%2))
		if [[ result -eq 1 ]]
		then
			((cash++))
		else
			((cash--))
		fi
	done
	PullAmount=$((cash - STAKE))
	echo $PullAmount
}

#total amount  of win and loose
function total_amount()
{
	for ((i=1; i<=20; i++))
	do 
			totalAmount=$((totalAmount + $(bet)))
	done
	if [[ $totalAmount -gt 0 ]]
	then
		echo "Winner Count is : $totalAmount"
	else
		echo "Looser Count is : $totalAmount"
	fi
}

#calling to function
total_amount
