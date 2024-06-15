extends VBoxContainer
var addPlayerVariable=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace w ith function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for x in range(0,int(Global.map["players"])):
		addPlayer(x)
	if(Global.gameStarting==true):
		addPlayerVariable=true

func addPlayer(x):
	if(addPlayerVariable==false && Global.gameStarting==true):
		var p_SCN=preload("res://PlayerRow.tscn")
		var p=p_SCN.instantiate()
		add_child(p)
		p.setNameAndMoney(Global.allPlayers[x].name,Global.allPlayers[x].moneyAmount,Global.allPlayers[x])
		p.addRole(x)
