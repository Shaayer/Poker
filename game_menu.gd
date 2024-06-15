extends VBoxContainer
var starting=false;
enum{Fold, Raise, Check_Call}
var raiseV=false;
#make column titles 1 color, make turn, minimum Bet, and minimum bet reached different shades of 1 color, make pot 1 color.
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	Global.connect("RoundOver",onRoundOver)
	Global.connect("RoundStart", onRoundStart)
	
func onRoundOver():
	$"Who won?".show()
	$Top_Half.hide()
	$Buttons.hide()
	$"Winning Buttons".show()

func onRoundStart():
	$"Who won?".hide()
	$Top_Half.show()
	$Buttons.show()
	$"Winning Buttons".hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.gameStarting==true:
		show()
		
func handleAction(action):
	print(action)
	var currentPlayer = Global.allPlayers[Global.currentTurnIndex]
	
	if(currentPlayer.fold==false && currentPlayer.kick==false):
		if(action=="Fold"):
			currentPlayer.fold=true
			print(currentPlayer)
			Global.turnUp()
		elif(action=="Raise"):
			raiseV=true
			$Buttons.hide()
			$"Raise Buttons".show()
			for child in $"Raise Buttons".get_children():
				child.button_down.connect(_on_button_down.bind(child.text, currentPlayer))
		elif(action=="Check_Call"):
			if(currentPlayer.highBet<Global.minimumBet):
				if(currentPlayer.moneyAmount-Global.minimumBet<0):
					currentPlayer.highBet=Global.minimumBet
					Global.pot += currentPlayer.moneyAmount
					currentPlayer.moneyAmount=0
				else:
					currentPlayer.highBet=Global.minimumBet
					currentPlayer.moneyAmount -= Global.minimumBet
					Global.pot += Global.minimumBet
			print(currentPlayer)
			Global.turnUp()

func _on_button_down(raiseAmount,currentPlayer):
	print(raiseAmount)
	raiseAmount=int(raiseAmount.substr(1,-1))
	if (currentPlayer.moneyAmount>raiseAmount+Global.minimumBet or currentPlayer.moneyAmount==raiseAmount+Global.minimumBet):
		print("raise correct")
		currentPlayer.moneyAmount -= raiseAmount+Global.minimumBet
		Global.minimumBet=raiseAmount+Global.minimumBet
		currentPlayer.highBet=Global.minimumBet
		Global.pot = Global.minimumBet + Global.pot
		print(currentPlayer.name)
		print(currentPlayer.moneyAmount)
		print(Global.minimumBet)
		print(currentPlayer.highBet)
		print(Global.pot)
	else:
		if(currentPlayer.highBet<Global.minimumBet):
				print("raise wrong")
				if(currentPlayer.moneyAmount-Global.minimumBet<0):
					currentPlayer.highBet=Global.minimumBet
					Global.pot += currentPlayer.moneyAmount
					currentPlayer.moneyAmount=0
				else:
					currentPlayer.highBet=Global.minimumBet
					currentPlayer.moneyAmount -= Global.minimumBet
					Global.pot += Global.minimumBet
	print(currentPlayer.moneyAmount)
	print(Global.minimumBet)
	raiseV=false
	Global.turnUp()
	$Buttons.show()
	$"Raise Buttons".hide()


func _on_check_call_button_up(extra_arg_0):
	pass # Replace with function body.
