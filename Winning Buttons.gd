extends GridContainer
var addPlayerVariable=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for x in range(0,int(Global.map["players"])):
		addPlayer(x)
	if(Global.gameStarting==true):
		addPlayerVariable=true

func addPlayer(x):
	if(addPlayerVariable==false && Global.gameStarting==true):
		var p_SCN=preload("res://win_button.tscn")
		var p=p_SCN.instantiate()
		add_child(p)
		p.player=Global.allPlayers[x]
		p.setName(Global.allPlayers[x].name)
		

