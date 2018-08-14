#!/bin/bash

childTicket=7
teenTicket=12
adultTicket=20

# Creates entry box for money variable
money=$(zenity --entry --title="Greeting" --text="Hello, $USER, How much money do you have to spend on your family seeing a movie?")

# Creates entry box for child variable
child=$(zenity --entry --title="Children" --text="How many children will be attending?")

# Creates entry box for teen variable
teen=$(zenity --entry --title="Teen" --text="How many teens will be attending?")

# Creates entry box for adult variable
adult=$(zenity --entry --title="Adult" --text="How many adults will be attending?")

sum=$(( (child * childTicket) + (teen * teenTicket) + (adult * adultTicket) ))
remaining=$(( money - sum ))

# Added code to use zenity UI boxes
if [ $sum -le $money ]; then
	if [ $remaining -ge 0 ]; then
		zenity --info --title="Enough money" --width 500 --text="You have enough money to see the movie and you have $remaining left over for snacks!"
	else
		zenity --info --title="Not enough money" --width 300 --text="You don't have enough money to see the movie."
	fi
else
	zenity --info --title="Not enough money" --width 300 --text="You don't have enough money to see the movie."
fi
