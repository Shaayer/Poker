extends Control
@export var play: LineEdit
var label;
var num = ""
var playersNames=[]
var playernum=0
var playerScene=preload("res://player.tscn")
var dealer=0
var big=1
#signal
#signal done_setting_up

# Called when the node enters the scene tree for the first time.						
func _ready():
	label=$"Game Set"
	play=$LineEdit
	label.text=""
	label.text=questions.keys()[questionsCounter]
	$"Player Set".connect("done_setting_up",_on_done_setting_up)


@export var x: bool

var questions: Dictionary={
	"How many players are there?": "players",
	"What is the little blind?": "l",
	"What is the big blind?": "b",
	"How much should each player start with?":"money"}
var questionsCounter=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("enter"):
		
		#For The first set of questions(set up)
		if questions.size()>questionsCounter:
			num=int(play.text)
			addLine()
		
			#This gets the questions that will be asked
			var question=questions.keys()[questionsCounter]
			#This changes the value of the map[key]
			Global.map[questions[question]]=num
			print(question)
			print(Global.map[questions[question]])
			questionsCounter=questionsCounter+1
			
			#sets label.text
			if questions.size() > questionsCounter:
				question=questions.keys()[questionsCounter]
				label.text=label.text+"\n"+question
			else:
				askPlayerNames()
				#Finding Player Names(set up 2)
		#Needs the first else above in line 46 because this else is not seen until next frame.
		elif(playernum<int(Global.map["players"])+1):
				var currentName=play.text
				var p = playerScene.instantiate()
				addLine()
				askPlayerNames()
				p.name=currentName
				add_child(p)
				print(p)
				Global.allPlayers.append(p)
				if(playernum==int(Global.map["players"])+1):
					$"Player Set".starting=true
					
					#emit_signal("done_setting_up")
		
		
func addLine():
	label.text=label.text+"\n"+play.text+"\n"
	play.text=""
func askPlayerNames():
	playernum+=1
	if (playernum<int(Global.map["players"])+1):
		#print("What is player number "+str(playernum)+"'s name?")
		label.text=label.text+"\n"+"What is player number "+str(playernum)+"'s name?"
	


func _on_done_setting_up():
	Global.dealer=0
	Global.little=1
	Global.currentTurnIndex=int(Global.map["players"])-1
	Global.rounds=1
	Global.minorRound=1
	if int(Global.map["players"])==2:
		Global.big=0
		Global.starter=1
	elif int(Global.map["players"])==3:
		Global.big=2
		Global.starter=0
	else:
		Global.big=2
		Global.starter=3
	Global.currentTurnIndex=Global.starter
	Global.firstBlinds()
	Global.gameStarting=true
	play.hide()
	label.hide()
	
