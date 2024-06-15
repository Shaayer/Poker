extends Button

var player: Player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(player.fold==true or player.kick==true):
		hide()
	else:
		show()

func setName(name):
	text=name


func _on_button_up():
	player.moneyAmount += Global.pot
	Global.roundOverUp()
