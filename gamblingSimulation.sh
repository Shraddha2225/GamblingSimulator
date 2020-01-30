#!/bin/bash -x
#welcome text of gambler
echo "Welcome Gambling Simulation"

#CONSTANTS
STAKE=100
BET=1
DAY=20

#calculate percentage
PERCENTAGE_OF_STAKE=$(( STAKE * 50 / 100 ))

#VARIABLE
UpperCash=$(( STAKE + PERCENTAGE_OF_STAKE ))
LowerCash=$(( STAKE - PERCENTAGE_OF_STAKE ))
cash=$STAKE

#declare dictionary
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
	#calculate gainamount
	CurrentAmount=$((cash - STAKE))
	echo $CurrentAmount
}

#total amount  of win and loose
function total_Monthly_amount()
{
	for ((day=1; day<=$DAY; day++))
	do
		#winlooseDict[Day$day]=$(GamblerBet)
		winlooseDict[Day$day]=$((${winlooseDict[Day$((day-1))]} + $(GamblerBet)))
	done
	echo "Key= ${!winlooseDict[@]}"
	echo "Value= ${winlooseDict[@]}"
}

#function to  calculate luckiest days
function LuckiestDay()
{
	echo "Luckiest day in month..."
   for((day=1; day<=$DAY; day++))
   do
      echo "Day$day" ${winlooseDict[Day$day]}
   done | sort -k2 -rn | head -n1
}
#
#
##function to calculate unluckiest days
function UnluckiestDay()
{
	echo "Unluckiest day in month.."
   for((day=1; day<=$DAY; day++))
   do
      echo "Day$day" ${winlooseDict[Day$day]}
   done | sort -k2 -n | head -n1
}

#main fuction calling 
function main()
{
	total_Monthly_amount
	LuckiestDay
	UnluckiestDay
}
main
