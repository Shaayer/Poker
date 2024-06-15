extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.gameStarting==true):
		#Round
		var round=$Round
		round.text="Round "+str(Global.rounds)
		#Turn
		var turn=$Turn
		turn.text=str(Global.allPlayers[Global.currentTurnIndex].name) + "'s Turn"
		#Minimum bet
		var minimumBet=$"Minimum Bet"
		minimumBet.text="Minimum Bet: $"+str(Global.minimumBet)
		#Minimum bet reached
		var minimumBetReached=$"Minimum Bet Reach"
		var player=Global.allPlayers[Global.currentTurnIndex].name
		if(Global.allPlayers[Global.currentTurnIndex].highBet==Global.minimumBet):
			minimumBetReached.text=player+" has bet the minimum."
		else:
			minimumBetReached.text=player+" has not bet the minimum."
		#Pot
		var pot=$Pot
		pot.text="Pot: $"+str(Global.pot)
		#Cards
		var cards=$Cards
		if(Global.minorRound==1):
			cards.text="Deal out the hole cards."
		elif(Global.minorRound==2):
			cards.text="Put out the flop cards."
		elif(Global.minorRound==3):
			cards.text="Put out the turn card."
		elif(Global.minorRound>3):
			cards.text="Put out the river card."
			
		var kick=$Kick
		var kickStr=""
		var kickList=Global.kickList
		if(len(Global.kickList)==0):
			kickStr="No one has been kicked"
		else:
			kickStr=""
			for i in len(kickList):
				if(i==0):
					kickStr=kickList[0]
				if(i==len(kickList)-1):
					kickStr=kickStr+" and "+kickList[i]
				else:
					kickStr=kickStr+", "+kickList[i]
			if(len(kickList)==1):
				kickStr=kickStr + " has been kicked."
			else:
				kickStr=kickStr+" have been kicked"
		kick.text=kickStr
		Global.kickList=kickList
	
