#set the starting positions
extends Node
var starting=false
signal done_setting_up
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (starting==true):
		for i in range(0,len(Global.allPlayers)):
			Global.allPlayers[i].moneyAmount=Global.map["money"]
		starting=false
		emit_signal("done_setting_up")
		#print(Global.allPlayers)
