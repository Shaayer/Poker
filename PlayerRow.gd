extends HBoxContainer
@onready var Role=$Role
@onready var Money=$Money

var Name;
var player;
var number;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	setNameAndMoney(Name,Global.allPlayers[number].moneyAmount,player)
	addRole(number)

func setNameAndMoney(names,money,players):
	var Str=names + " - $"+str(money)
	Name=names
	player=players
	Money.text=Str

func setRole(role):
	Role.text=role

func addRole(x):
	number=x
	var list=PackedStringArray([])
	if(Global.dealer==x):
		list.append("Dealer")
	if(Global.big==x):
		list.append("Big Blind")
	if(Global.little==x):
		list.append("Little Blind")
	if(Global.starter==x):
		list.append("Starter")
	var Roles;
	Roles=", ".join(list)
	if(len(list)==0):
		setRole("Nothing")
	else:
		setRole(Roles)

