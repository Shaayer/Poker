extends Node
class_name Player
var moneyAmount=0
var highBet=0
var fold=false
var kick=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _to_string():
	return(str([name,moneyAmount,highBet,fold,kick]))
