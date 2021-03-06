#!/bin/bash

# Default values (prices) for movie tickets
childTicket=7
teenTicket=12
adultTicket=20

echo "Hello, $USER" 
echo "How much money do you have to spend on your family seeing a movie?"

read money

echo "How many children will be attending?"

read child

echo "How many teens will be attending?"

read teen

echo "How many adults will be attending?"

read adult

# Calculates total sum
sum=$(( (child * childTicket) + (teen * teenTicket) + (adult * adultTicket) ))

# Calculates remaining amount
remaining=$(( money - sum ))

# If statement to determine if user has enough money
if [ $sum -le $money ]; then
	if [ $remaining -ge 0 ]; then
		echo "You have enough money to see the movie and you have $remaining left over for snacks!"
	else
		echo "You don't have enough money to see the movie."
	fi
else
	echo "You don't have enough money to see the movie."
fi
