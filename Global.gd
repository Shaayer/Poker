extends Node2D
var allPlayers=[]
var map={"players":0, "l": 0, "money": 0,"b":0}
var dealer;
var little
var big
var gameStarting=false
var starter
var rounds=0
var currentTurnIndex=0
var minorRound=0
var minimumBet=0
var pot=0
var kickList=[]
signal RoundOver
signal RoundStart
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func turnUp():
	currentTurnIndex+=1
	if(currentTurnIndex==map["players"] && starter==0):
		#print("minorRound + 1")
		currentTurnIndex=0
		minorRound+=1
		if minorRound==5:
			print("Rounds + 1")
			emit_signal("RoundOver")
			
			
		else:
			if(allPlayers[currentTurnIndex].fold==true):
				while(allPlayers[currentTurnIndex].fold==true):
					turnUp()
	elif(currentTurnIndex==starter):
		print("minorRound + 1")
		currentTurnIndex=starter
		minorRound+=1
		if minorRound==5:
			print("Rounds + 1")
			emit_signal("RoundOver")
			
			
		else:
			if(allPlayers[currentTurnIndex].fold==true):
				while(allPlayers[currentTurnIndex].fold==true):
					turnUp()
	elif(currentTurnIndex==map["players"]):
		currentTurnIndex=0
	else:
		if(allPlayers[currentTurnIndex].fold==true):
				while(allPlayers[currentTurnIndex].fold==true):
					turnUp()

func firstBlinds():
			if(big==little):
				minimumBet=int(map["b"])+int(map["l"])
				allPlayers[big].highBet=minimumBet
			else:
				minimumBet=int(map["b"])
				allPlayers[big].highBet=minimumBet
				allPlayers[little].highBet=int(map["l"])
			allPlayers[big].moneyAmount = allPlayers[big].moneyAmount-map["b"]
			allPlayers[little].moneyAmount = allPlayers[little].moneyAmount-map["l"]
			pot += int(map["b"])
			pot += int(map["l"])

func roundOverUp():
	for x in range(0,map["players"]):
			var current=allPlayers[x]
			current.highBet=0
			current.fold=false
	rounds+=1
	minorRound=1
	currentTurnIndex=0
	minimumBet=map["b"]
	pot=0
	if(dealer+1==map["players"]):
		dealer=0
		while(allPlayers[dealer].kick==true):
			if(dealer+1==map["players"]):
				dealer=0
			else:
				dealer+=1
	else:
		dealer+=1
		while(allPlayers[dealer].kick==true):
			if(dealer+1==map["players"]):
				dealer=0
			else:
				dealer+=1
	if(big+1==map["players"]):
		big=0
		while(allPlayers[big].kick==true or allPlayers[big].moneyAmount <map["b"]):
			if(allPlayers[big].kick==false):
				kickList.append(allPlayers[big].name)
				allPlayers.remove_at(big)
				map["players"] -= 1
				allPlayers[big].kick=true
			if(big+1==map["players"]):
				big=0
			else:
				big+=1
	else:
		big+=1
		while(allPlayers[big].kick==true or allPlayers[big].moneyAmount <map["b"]):
			if(allPlayers[big].kick==false):
				kickList.append(allPlayers[big].name)
				allPlayers[big].kick=true
				allPlayers.remove_at(big)
				map["players"] -= 1
			if(big+1==map["players"]):
				big=0
			else:
				big+=1
	if(starter+1==map["players"]):
		starter=0
		while(allPlayers[starter].kick==true):
			if(starter+1==map["players"]):
				starter=0
			else:
				starter+=1
	else:
		starter+=1
		while(allPlayers[starter].kick==true):
			if(starter+1==map["players"]):
				starter=0
			else:
				starter+=1
	if(little+1==map["players"]):
		little=0
		while(allPlayers[little].kick==true or allPlayers[little].moneyAmount <map["b"]):
			if(allPlayers[little].kick==false):
				kickList.append(allPlayers[little].name)
				allPlayers[little].kick=true
				allPlayers.remove_at(little)
				map["players"] -= 1
			if(little+1==map["players"]):
				little=0
			else:
				little+=1
	else:
		little+=1
		while(allPlayers[little].kick==true or allPlayers[little].moneyAmount <map["b"]):
			if(allPlayers[little].kick==false):
				kickList.append(allPlayers[little].name)
				allPlayers[little].kick=true
				allPlayers.remove_at(little)
				map["players"] -= 1
			if(little+1==map["players"]):
				little=0
			else:
				little+=1
	if(allPlayers[currentTurnIndex].fold==true):
		while(allPlayers[currentTurnIndex].fold==true):
			turnUp()
	else:
		if(big==little):
			minimumBet=int(map["b"])+int(map["l"])
			allPlayers[big].highBet=minimumBet
		else:
			minimumBet=int(map["b"])
			allPlayers[big].highBet=minimumBet
			allPlayers[little].highBet=int(map["l"])
			
		currentTurnIndex=starter
		allPlayers[big].moneyAmount = allPlayers[big].moneyAmount-map["b"]
		allPlayers[little].moneyAmount = allPlayers[little].moneyAmount-map["l"]
	
	pot += int(map["b"])
	pot += int(map["l"])
	emit_signal("RoundStart")
