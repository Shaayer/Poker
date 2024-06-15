GDPC                P                                                                      "   P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�X      #      �&^�j!k�c�r�����    X   res://.godot/exported/133200997/export-3176f3f4ab7fd48ab19332ecb0668741-win_button.scn  %           /t��Z�
e#�"юQ�    T   res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn  �_      i      �>�_D_T����$�r�    X   res://.godot/exported/133200997/export-37c47c2d084a3a67437f51e759903a9d-PlayerRow.scn   �e      �      �Š��T崈�'I��    T   res://.godot/exported/133200997/export-cf8532bc06c1243e731119a1dc90fa78-global.scn   7      k      �nq����c�1�܍    T   res://.godot/exported/133200997/export-da3c52c1d1e8632f6d27195cf30ab181-label.scn   �Q      �      �JL�4�
a<{��+.    X   res://.godot/exported/133200997/export-de75b109a0ef34bfbb9569df46f58a57-new_theme.res   �Z      t      ��"�C��5[�W��D�    X   res://.godot/exported/133200997/export-fdaed7e491d039e2a0cca5d73581150a-game_menu.scn   �      �      f���\ZW>�P.�l�    ,   res://.godot/global_script_class_cache.cfg  �+     �       s��Z�h%��tƬ��    \   res://.godot/imported/ProtestStrike-Regular.ttf-5c8b1d7fe067996c5f080f3d85bf516d.fontdata   pi      Ӷ      �T|��:�m���h&    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexp9      �      �Yz=������������       res://.godot/uid_cache.bin   0     ;      �5!WMb�Wsh^<� 7       res://1st_2nd_Rows.gd           �      b8�W�h�n?�� <       res://3rd_Column_VBox.gd�      �      B�}�r}���߯�t       res://Global.gd `%      �       ��Ɗ@,��_g'�!�       res://Player Set.gd @\      �      ��(x/���"L`�]       res://PlayerRow.gd  @b      �      Ǿ���V�)J�� ��       res://PlayerRow.tscn.remap  �*     f       7%���Z�/��y�s5J    (   res://ProtestStrike-Regular.ttf.import  P      �       ��rߺ����HҚq"J       res://Winning Buttons.gd!     W      ժ��R�� ��D��'       res://game_menu.gd  �	      8      ���%͝��#ߩ7��       res://game_menu.tscn.remap  0(     f       �1�Js���ov�!���       res://global.tscn.remap �(     c       ���4�"K�`�u4	�       res://icon.svg  @,     �      C��=U���^Qu��U3       res://icon.svg.import   PF      �       4߳d#�Ѩ�)�KwJ       res://label.gd   G      g
      �d��.e|�$qR       res://label.tscn.remap  )     b       F)a��,o�m�inh/e       res://main.tscn.remap   �)     a       �J�Sw� ������       res://new_theme.tres.remap  �)     f       `|Q�V�oe˘H��`l`       res://player.gd @^      �      �Um�$�ا5MK�\��       res://player.tscn.remap `*     c       ������T�?�L���       res://project.binary@1     B      �
�U�\�!��kkR       res://win_button.gd p#     �      �jŤ$d�6C��a��L       res://win_button.tscn.remap @+     g       ʙ��"������                extends VBoxContainer
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
  extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.gameStarting==true):
		print("running")
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
	
        extends VBoxContainer
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
        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    default_base_scale    default_font    default_font_size    script 	   _bundled    	   FontFile     res://ProtestStrike-Regular.ttf �?�@��h   Script    res://game_menu.gd ��������   Theme    res://new_theme.tres ny��k	   Script    res://1st_2nd_Rows.gd ��������   Script    res://3rd_Column_VBox.gd ��������   Script    res://Winning Buttons.gd ��������      local://Theme_8bn82 Y         local://PackedScene_qge70 �         Theme                       *            PackedScene          	         names "   7   
   Game Menu    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    size_flags_horizontal    theme    script    VBoxContainer 	   Who won?    visible    layout_mode    size_flags_vertical    text    Label 	   Top_Half    Column_Titles    HBoxContainer    Money_Label !   theme_override_colors/font_color    Role_Label    Other_Data_Label    Data    ScrollContainer    size_flags_stretch_ratio    1st_2nd_Rows    3rd_Column    MarginContainer    3rd_Column_VBox    Round    custom_minimum_size    autowrap_mode    Turn    Minimum Bet    Minimum Bet Reach    Pot    Kick    Cards    Buttons    Fold    Button    Raise    Check_Call    Raise Buttons    +5    +10    +20    +50    +75    +100    Winning Buttons    columns    GridContainer    handleAction 
   button_up    	   variants    &        �?                                               	   Who won?                   ��?��?��>  �?      Money       Role       Other Data       @                  
      D  HB      Round 6    ���>��?  �?  �?   	   A's Turn       Minimum Bet: $50       A has not bet the minimum.        ��	?      �?   
   Pot: $200       No one has been kicked.       adsfjdsafads       Fold       Raise       Check/Call       +5       +10       +20       +50       +75       +100                Check_Call       node_count             nodes     �  ��������       ����                                                              	   ����   
                                                ����                                ����            	                    ����                  
                          ����                  
                          ����                  
                          ����                                ����                                      ����                                                  ����                   
             ����                                ����                                                   ����                                                     !   ����                                                     "   ����                                                     #   ����                                                     $   ����                                               %   ����                                                &   ����                          (   '   ����                                (   )   ����                                (   *   ����                                    +   ����   
                             (   ,   ����                                (   -   ����                                (   .   ����                                 (   /   ����                  !              (   0   ����                  "              (   1   ����                  #               4   2   ����   
                  3         $             conn_count             conns               6   5                       6   5                       6   5         %             node_paths              editable_instances              version             RSRC        extends Node2D
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
              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Global.gd ��������      local://PackedScene_s873i          PackedScene          	         names "         Global    script    Node2D    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC     GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://csq6jtjex64oc"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                extends Control
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
	
         RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Theme    res://new_theme.tres ny��k	   Script    res://label.gd ��������   Script    res://Player Set.gd ��������   PackedScene    res://game_menu.tscn *d!�{�'      local://PackedScene_ecuqb �         PackedScene          	         names "         gui    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    theme    script    Control 	   LineEdit    anchor_top $   theme_override_font_sizes/font_size 	   Game Set +   theme_override_font_sizes/normal_font_size    text    autowrap_mode    metadata/_edit_use_anchors_    RichTextLabel    Player Set    Node 
   Game Menu    	   variants                        �?                                  ����   fff?          d      �   abcdefghjiklmnop
adlkjf

adjflajdl;f
kldsafj;ldaj
;lkasjfdlj
a;jda
kl;;kdjaf
kl;as;ljd;lkfa;dlsk
lkasjd;flj;daklsf
ds;fjdkl;asjf
a;dfsj;l
asdljdfjds
fjdsjfsd
kfkfds
fasdfkds
fjds
kfjdsk
jfk
dsfkdskf
dsafjdsf
dsfdk
d
f
ds
kfdsjk
f                               node_count             nodes     Y   ��������	       ����                                                                
   
   ����                                          	      
                     ����	                                    
                                       ����                     ���                         conn_count              conns               node_paths              editable_instances              version             RSRC      RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_f6v2j �          PackedScene          	         names "         main    Node2D    	   variants              node_count             nodes        ��������       ����              conn_count              conns               node_paths              editable_instances              version             RSRC             RSRC                    Theme            ��������                                                  resource_local_to_scene    resource_name    default_base_scale    default_font    default_font_size    script    	   FontFile     res://ProtestStrike-Regular.ttf �?�@��h      local://Theme_v10me >         Theme                       1         RSRC            #set the starting positions
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
             extends Node
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
             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://player.gd ��������      local://PackedScene_mk2kj          PackedScene          	         names "         Player    script    Node    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC       extends HBoxContainer
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

    RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://PlayerRow.gd ��������      local://PackedScene_fxisp 
         PackedScene          	         names "   
      PlayerRow1    size_flags_vertical    script    HBoxContainer    Money    layout_mode    size_flags_horizontal    text    Label    Role    	   variants                                	   A - $300       Dealer       node_count             nodes     %   ��������       ����                                  ����                                     	   ����                                conn_count              conns               node_paths              editable_instances              version             RSRC               RSCC      RJ �
  X	  5  l	  (  �    d	  �	  �  �  �     �  �  w	  �	  �
  �  
  a  (�/�` U ڣ�#Q V2��+@����!}�f}�P�}Q�传�[�;;ҳ�N���sc'C��ɭ�6���z���"gSvv��~"e
���U�/�$�i��� ��=Q��1_�D����!�Ak�j����3J����[�r�����v�[?�����s�c喊��s�W��Q�J�n��/��Cة��fR�ٟ��K�>'`۫��O�_x��U"���f����<� )XTY1��?0���Օ��Ԁs
�*�_�h?��yy2II�G�l���}�Rڳ���.�C�Vg�]��f�)��s�s�LB6�U�+ս��k��Q*�J[���k6ޒ�6;�v��X���p��u���ewn�w��ci�}�-dҭJ[���ew�f�n�knݭ���1�.6�tw_�����ѩ��Y��Vκ<���g�~�����[ѫ;�?�h��jeq�+S�6ݚ�ש�}���ng��F�.L}�Յ�*}g+�����+�ب���b��V�*���\��n�]�Y���
�r�Z�w��������}�Qwn�.�R�뼝۩�C�jY��������݅]��稵��֨+�rŲ�����_�aw����S�m�e���������	������em�alݷ	�w�e?�ip��-cþ�6L��f����4Z?
�F��f��=F�+�H�>�?D������h������Q�uM�ϴL��t�?�3�7�2�w�L\_��p�+�r})��������'r���o]���?�w}�]h��J[�w���6Ώ��e����;[���������R�w8��~��Jt�Dî�sމ�͛~
����MeQ��]Gb-@�u{���0 %��7P�"�
��kS����,"��h�D]P*�;oE������fE�6��C7����0��=��]X�k�Q�-ܨ@뮬8|J�a�j'�����i8���V� ]�?kO��/в�������9_i������K�����R쟇}�G^�Uf�b�/0UDu� C�E�����N�@hxb�]�{���T&��|� �a��(������c���Wm�}�������%��b�9I��"ƩY����S�< �鿆�룽nEv�v�f�&@U@\~��@����?V|`���=3V4������y��"��Cfg�qh'��w��4����l�'r��ْS@�U�3�
8.�g	G�.�N�Έ.KG��l�6949.9,�r䮹67���p�&p"�*�9�せ�j�pM�Wñ�-q#���{;�V�6u+s憃������f�-�6ek�m<ۍ��Z5/�)�'5jU5[�--	J[Ҋ�/�3����6��9�ѐ�dRb�X/��9�1��]���@l.�Naw�!���^���Ac�'�%ZH��J�����G�����u.����Q��ϑt���>���t�[��T?�k���7~��/<�ş���[���|ғ~�2�u��׸��u���<?~�W���z��|��z|�z��=~o�L�Q��{X���=������ߋ3����3�����{���ߧw/�{��[w�}�����X�}>��S�]�����O���S�}��/�x������G���?�y]�A�������mJ�.1�1��¢r25����� ��N�N�J�i�S�s���g�'�����9{� E�rJ��n��D��B�	QDe����pbq���:�h��@�����RB�yR�	~�zjz"z�=�y��9/���],�(�SNRNI4)Д�DEZ0�bׂ�+LA���BX����Y��B�IS���6m4h�h&�EM�f���

sf�"L�$��	��15�kIf9Ē˒ʒ�e�����ǒ�Ʋ�Ҹ.�(��E)� ��(#PQ�J-� J�5I(�b�_�]�3$-HB�j��$�A*��Fj!@�@>!�H#��Cnd��	���G�UG��w�����g0.`2�i�5E(�b�%c��<E]�"�!f!B!F@B�A�AD��>Dq������C+C�$����!�a�p
�,HR�P@		RHT]9z�p��!�"�"�:2���*���H$�	��˨�ѕ��HJQ	EIEb��u!��(
Q�&����$!�$h$$(���V�gp)ނ^@%�; k B.
�  �>�U~O~���/�[������/�����Ǧw�wD���^��7��z;=0B	��	I�3�'�Z���[��V�l�6A7ytA�A4�|A_�v�¨� b���$i�P1��� tR���PQA�>��Q�m��r�!N����H.�9!�G]'�4g�kC~�m��A8�B�Y�H�z�l�����j���ߒ��ͯ�&x����ALr0������bXb�K;�E�q�:҆C��SޏG�����8�c(��Tdm\T�A�b�@�� k��#h�JRWi�Z�-7k��b�k*o�蔄<Gm�B'U5��-�N��zu�"ș��Ӓ�
7L�)�⽗��A���+���O�O99t̄ЖT��
�#��PA�%͕��@g=����O9�-ee�����G%�d�� *� ���O���LNU�G?�;m����&�<.+^�G/-��(N�$�y����SĈY�8p7��&�xfb�[m۩TATx)���f��ȉ$��P�C ����#r(�/�` uJ �� BP���a��cm�O�G=������MA,�%x`R&�,�gt�F6�S�of_x��A?�+-�kd������fY�fwq�e?뢳,��j
���"���
�X�{�i���V=�VJ��W�z��9�ܑgi�:2G��i#˒,k$�˾�P8���M;���)�j��<�w��hj�<MÚsШ��Z�Q/;�@�ў~Q)�k�*��H�����Rb�xbѐ�I���QG<�S��B�B���U�B�\��p�;��-Z�H�������/c�e�P��7f=([��Y3==9O�E�]��@Q��"
���S,5���x�_���<��ɥə=&��3{t�Kb��.��ʣ\��G�4"V�إE=f��t���g97#jy�ΰ�������	�n^>�	݄C�=�\B+!��	�$�*�����c�W^<,��H�Cs�����wdw0���]�5;1;�ݤ�=u��۪��D�%N��ѩ�㣳�;�Ӣ�4isn�i�ɟ�rp���	�n�qɝ�k�1&)�\�C�B��$qM,��$ǒ=J|(��� �0�Co���eJ�$�
nO�(��iKk{��ǶŶ�d
ɟ52kX~��į��~~~������ӟ����C�a�p�p/�73��G��#���J+��8h4C�v�9>��Ũ5����x�	c�\��X%��F�(_��c驔JD[����լ}����p���&���IE�)`O�����Z�]��}�}e}��Ba$4
�|�<㝑�g�2��h�1l�F#����/b�(&���+�J���L���P�%�ԑdɕ�*�1�O�M5h��5G�f�X��b6���~L�]�"��En�Vfe��Jy���N�TN�M�j�E��F����)�ީ���jU��s~*����i�t�j��i�j���Ǭ�/llǦV|l?q^���[v�
�ڎG�e�aġ��e�8=c�Px^7������Ɩ5�
+T��(���\e��ధ�h��n��伥|e��橽�n�*}Ҿ�l�Q�7�
k�z�=X�T����m��O��ip��75T�>f���+�E;�3��U�y��$�`�b�FG�l�V�Q)�5�b}� �r -��Q��jw�W]�W��j��:7�:��k�(��Zd52�9E��t���o+1�b��b[:���k#�q�c<��Hk-�'�4 �i�N�,����b�%��%REb ڢ,�M��$��b��7�>��V�;�y�y.s������V��n3y�6����~��Ws�b�X��>�S>šk�jY�>�*$���T��HB����j�C{��&zD?�R5�JE���A�T�>�05�R*,]�*׳���a�Q�F��>bI���Re]����Fa.a9�Ϭ��e*OY��u�}䴅L���kqG%�`*I���e�#�L�0Q���HKU�;Ԅ�Mb>8p�0L�ǉ�&��j"��h���)1���!}HG�%��H�j�7sGn���C�:�X�4$J�.A)�H�"1�t��OI)6Z��f'�`��&5T����)��6�}$��)�f�1�� ~��4�KKC�l �E$�Q�>K��/!vW=�zf��!�]�4�jIvW�VK�հ���UIM�~�$֝�k��@;�[����UgɨD����J�S�(�fj��$��(��
�ZCi�eT�A_؂�p=���p��9���K��}��=#P=k)��T�l�`$�Z!�H�\�/P/�h�}t�ju�!m���U�9��O��iw:�K|�r����0Ԍ�چQ\�Q�p�Vq�W��U�0�8<��[��,��AG�BoeVr�W^%�t�5@�"��>RH�@�pZ8�,�l�q��7/�@c����r�[��	��M�*��3��?�5[��<�]���J�R%r�Ҩ�yc��.�0�i�7��5(�054%ta
h0��3aJ�S
g*�*�����I���W6��vM����4$2$"#""I�t����!z K�2�� -((�?:�ip��q�d/��-�J>�z�v�l�#�'��>����w|�w��� ׿�qmK�����S�_q�A�8Q��xt���@����U�[�;��^�
y);d&cn��1g	����`y��s��R���ҟ�!-:�۽v���a�u��[^��.��D���?����+jC+-5��s�|�l%�V�z+���f �h����=B]߰�]x+*%�!f�u��/R{Aܠ��*�\��헓�j;�Fn��l.y[M��yG�B����#y=���d����exg�I�j9��;�Ĵocu��i��g��|��m]e,�H&5�03���,����Ǫ�ė�q����U(�/�` ]A :y<F�\i<ϔ�7�ްw�I�}��ji휲����vsZ�0;忎�M3��b�v���$fM�	�.������%[�voi;���k��P����uRM�^3��d6ͤrh�M
T9��Y9����հ�ש���M�y=ċzL��u�:���*��_�k��#B�p��[��m���2|A��~�E�E\�GT��8��1�L��L�Aco c�;Scu
ou'j'w�����j75D��ԡ�ⷉj����)�Vcq�6�N�E]�z�T��P���f� �{�T���uWW����/j���������Z�QX-�][�b�F��6N����9��T��@Ii��i8�M�4�m��4�ÚUa]�
M�`����LJf@s�&��JI9O�r~%�L
k�os�%��]�TX�uQ�:����X���5��k��/�k��&kT����2�n�]K��fP�ְu�S�-��%gTQ�G}Y���~R��*�|X�+����Z��g���۳V�&,9s���$g����-K%��_�� 9��%kxAR�Tn���˨dy�aU!���9yK�_�AO��Ƕ�܋TU� g�w43�U�7׷F�T�J�?���Zc�=�̹��y�C����W��4m�<��ێ�,�^/xq}фi����ۻ�������KEլf19�����5a���<���6���(kK����Vc�Į�?]�����	�u9s�e��]��k/�5��H�]��5@��Fi7��;�
"?ȴ�G���Gڭ"�^�v�H�O|H����Y��H�����n��p^��uj��x&�w?q��;r���Aj�X*�}T�uԮ/�^���_���Xz���Ǳ�ڧ]HH�iG������̎�����h㗻W1�g�ԍ�7�r�Ceחa�N���Zm�G�Y���A�cX{\�֏��x�������(��C�!
���y��C�Q���;^��f͚���[�jn��y�}zޒR=_���Cv���?�y�餽�V�^�J�~ 9�m��sd�<����8�7ܾ�?�_���d����7�: x4�r��TᖓY�Mo��[B�y,�y��M*S�����;ޜǬ�U�����/�Orhz[��%K���#��.	���l�f�[�{*�Y���J���W/��%~�e�xq��e���3���,�^,Ǜ��f˲���'�,�쓲�b��$�\�d)��������M&L���p�y!�>\��E";�3ݘ?�}j=����Q��ڥK�n��ݟag���k��zʭ����t�����f��;3��v��/��\�ߚy��ӽ5�[c)�3�|���rC��v���HvJ�%k/R�D,��uА������~,��#��T5�o��煺P�څ�>�E�aPWGxQ�*�+�� 	CxQ���Pv��/o�*]&�F�1Yc,n��L"e/��#/[���t^e-V��Q��%x�����i��lM�7-N�d1R��X(F��b�
�:q(7�(���/�l�Lr��\�ض0Y�G�#�Kv�2Wq,�X(.�A1�
�:�l(�(r������BfFFDF���`2TC�@%5�)�B��#BR���������Tr�c�(�ƛ}��A ��3���>f�v�Q����)���
����,'���k~x��!��mj%b"V�k��\ꀢ��^�����Ϊ3]��n�.���b�b03z�>�6�.�(�}�1u���TA��� =V�/٪Nݘ#w N��N��[��@S���Pp`dG0�*t3������;M �1�0������IQ��������A�,��8�toRV �ۭ��7�y��f�;��r ��̽L���\��1Pd��$�I{Ã��l�E�Xë��56��Y�X0>���b7����֟���nd�p;J��9Y�|��|GR�d�XGӐ�~2l~����ZɎ/�<�/�7��������Ygz�(�Qܩ���V��5@= �VY���<��9�����_�s�Ͳl;<��T�\�l<�q����Uˉ����`�S�_0�Hhݐ�� ���C��d[�d�K����%_��+�M���5T�U�C�ƗU�s�ހ(�/�` K Z��A�U����������TM1`��
����Z����o�?e���>�d�h.O��J��[K��2����汔�`%�;C9�<	p(�'wr�_o�/�䮇�y�8�VL�c5i.15MW�����$Y��<&wV�t;:;2'�C[X:�uJ�8�a�'\���A�F���b |��Aу8؀���`��A��T��A�ͭ�<(V]ڬ��K��(����;�����ǆ�k���.m��T^ԥ͊vP�ӥͬ@��g�,ь�%��,���f��,���ҥ͈��X���%���ĤK��l,��fan){]Q�)���zb2�Ұ]��Ұ](Q��˥a�=P�H��U�|�bR|E#��L��b�,��"�n�v�f�;:6�PLf;O��{2s��i��SR�i�\Yԓٺ���*6��=�~�螼\�$��fx�b���Uɹ��҉��ZYNc�ܘS�Ӎ�v��xJ��+(�l���PL63a��ɈzJ��{�r�X�J���_�^ڬ�3���RޡX�j��8%�$'����Л��fY�h^�,�k�G7s�%�(W�i��q3��˸V2�1.��8�$��/�Ż8��H��Y\���c+^ũ���V��P�?q7v�m����ę8g���G�/6�W�I�q#N��8���A��pt���Ȃx��:��9���[✭o8fc�s��3\��q�2�.������*<���~u�3�%���-�"<���>�=� �wp��5x9�c�n�߼����ۼ��S�	����m��ٰ�T_s5�=�S�z�Ob>�;���;��?��>.�5_K�%�[0G�37sݝ��2g���|+}̓.e��y�̿<�.z=w{�͏����o��.��-�CﱖӜ�B�=�@?�?��f��e�v2L^����x�i���ώ���3�+�<�r1,��y�
<��a~�yn��X�Un�8��)��%��W�͎���f2o>d*�͎<7< �-��Z{>+z���:�D���q���<�D��N���
.C��%C���D���Q0�5�E��樥8jҒިڅr�[��B�P!j�A��PZ�$�f�Jo§����1X�x���!��*�iT�tF�Ph�z��P+TF���*�CCp�*@�P-| ���X�`|�<�Kp�,�_����F�?a'܄�p��^��O��Ns�,cY ��.&����oa��p�G8#� <��Ph�
uč�S�)T
�B�P� T  �>�X�Ul�0O�G1������
��E!pʄ�hHs�nQB��g�C)=55c�/�%��|�K�H��#o�|�s`E�yF��ɇܐrB�d<�9%�Á�����}��3yɆ�����X���<�����t|���8���v�m��g�5=�����rr&δ�X#kI�W����'����J�x8���
Q���X�B�p׋�T>(��IPM,�F�^���JV!ӎ��(-Q�~T=�&B���pj�%���c��I�B?d-��㹂�Ҏ��O%�i�fiG^��̨�k㝮�u��Z%k�fǱ��
��~J;�ʱ*s7;�����Ж�#Y��Q��쨃�ܜ@����W��zQMM��B��)���42=���ٚ�Y� �c}F�2�7h)�PK-+dG�H���	ɱ�?J�Rh��T�IU����e+iuR���R>�)�'�Z��#��M!�Xӎ�k��$YI�qv$q6\��)��Y����#&���/�U��z�A�Xk_`�(�^����u�d��7�V�j~1�E0�	U�"z��X�`Da�6�Ҏֺ��Ҏ��S��CV Ӗv���p�}?�Å>�X��x����e���Ұ��{;fo.^��)��o�5<�O�ws�~�����"+Y�!��@�"I"IR�4��!�����FA�B�5R��57;CxsV�t;wF��M���Q9��ED�d���p^T,�m��{㘑���f�����4����~F�M6\Jq��1��.Z�w���8�$�nN�����Z�S<Ɩ�1�#�`|�&�څ=	���2\2l�@�o�p�'o�e�/�fLԜ�p|�p}��<�y�9��B�ܵ�����p�U�������P��C �;��iXԙC�T�n�^	�:�vڃg�!���Qw\�Ņ��*��R�ˤ�FOz��̮��E�V�OC%���g�f���	� "om~����yt�@F0Mp��V��,ES[]PE0���Y��8U^�����XIh!L�^����7��4�N	>����
�ܹa%2�G��B�P:��'b<!�xp����K��Rm�-ڹ6�Aǡ�2��'0v�.��.�b��J ��;W'	:�(�/�` �( �<�H��:cd�1pJ�C�<;<	9=A���������Jj�q�U�>'ܒ(�CF�_��	��\\��8��U�磕;� � � ���6�!m?�tb�=i��v������}ڬցff���Xu�L'ҁ��9���z݀2�s�Y�8����6m5�SY.�ˁZ����֔}=6�n�~?��ey���_��:ϑݵף:�Qf�i��f�rA��V��no�Mc�J�㨒Ac,Ȃ.���Ck-��{�<�u�1��?/��Uo/��ַ�Y���r�c����<�^.|����{�/���)��4�|"�mO���$��3�����&���-;���X�$�"S$��mU��-��X�"n�P��5T��I����j�r��n;R��R4E�5�$�%���խ� �Z5feS��j�$mݲ���zݷu�;�"c��}�NjI�v�[�:�Y7U=6�5�ՓL�Z�SVsQ*�,ISY��� �FKuX� ~�1����!n����Od����W���X,���}�������C~������p�p�q^����uq�9��G�q�+.�Wa�;&��Ā?�?�%�� 3�&�{���餗n��+�C����D���I_��)����y�t��vSp���_Ym����w��I_]T=p�E���!�H�#JJ?����G)Q)a�
&fE�J&��Y��`V1�*��ߕ#d
���1�`����Չ�?NΟ��cŊ��"�1�����u� ��1���%�M�'Rr��	E� _ T�Z�:���\xM�p!���pC�sq�p��"d�Ec�2h�ȱ#��AB�7z
�IB/�A��q/���������$n����@�Ќ��HA���AV���q�����H$�BI��2u����;l��e�}֎'�.4�ώ	�o��n]ƙ�&sx�,+>��=�"0 #
�)�����D��0҅�����;�,��XG�����]:���Noz�X��[��|���KC�U[r�wl{��h���e� ~v�mqˇ�f�UdP��Iv_�/Pp���?S����6!w1��d�|k}V� Wx3�Y1�XCp��g	y�M�z���w�X�B�q�e.�=��SP�|-{Ԭ��7��`��쟿�vp���<�����Xܪ(���L��)>�ʉ��K��FA�����v�T�*�����K�ʁsC[���v��4:U���)�&�B1�BO�0ޞ׭���卵������.�� /X��iuA���S��F/�nƵ�-�~>�`T���U��N��~�S�$��(�/�` �, JD�?p�I���ë)p�d@�&�
�`�rS�����
$��c���(�O�&4�2� � � m�@�D���v?�I�ɠ�D >,��E���@`(����P���ACL�1�}�C�3�%"��
�-_�1ⳡ������oyZ��A������ļJbϩ@T�T���[�W�F/��%F��5F0����Q��Z�*Y��2>��ɌgV3��s�n�n|����G�q&D)V$\�@��E�O�<A�
2,�d��Aȋ�'Ys"/M�����8n{�GD����v�S,lP3.�*�,��B�0��#:<�]Z��A�`��}P6)L��n�V��$4�����r��(��e8��{�T���ԧ�I}e���aB-a�v���'-�E�C'_�~T:.��m@�-z�ɦ}�\�����Q�����p��G��A��0��]C��wo1�Vtw4��2�w����3�vBL{�'���[�_����U�⊢�bPc):��ШR�V�Ц2��K�;l���n@׽�>'��a.���F��f��e[��CVr�e�d�]l�s�#������é�˕Z�Ӭ^������6Ԫ���@�¯�CH	�0l8�`+X�Z�*���6�h�-%%�C?��Da��&���4W/�����U�&x4�����t�=Ϝ�Z�$���"���TS)݅���}�a5ke��-�3/��ك+\�����n:g�k~��z��O{ρ�k���wj�p��n��hj�k-ӧ�])��+���V�\�cʙ������b�7=_Ô�5�9�����+���R> ە7P�u��������{��6��qn�=��_��j�'p�(�N���cmԻ�h]뚣t���>���լB
�@�\�с���XrFD$)H
u1�)3� %2��hYI���!o璌h�Ui�}b�45ݺ��(̞Ia\
L�-L>�DA1ǭ��d�LaݐoV�s���1xʧ&���g�@c��]�9���٘�P��S���p�\<#����r�����!9��8J��6S����~�\ Z�q�V��4�uVf�f��X��$�c��:�)����&h��c���Mn�ٽV�����xG#�����*���*x2HK��<DbA�~Z��>Y�33���"g�M�d�i4��o 䡭04�#-:󱄰���ɕ����q�&��s�>�V����l����2,�����p������v���y`�V�ܽ��C�K~;�-V��\G~��R��=�_��^(*=�:�}:4v��J�ᮔ�]��t��,�⿗��|g��/ �TO$0��L�1��u�+W��z�*"�c���s��o>h��`��������-p���"��t�u��}	�,�p'y�B�8]��NvA��_��P%t��7��,�Iݦju�Ԍ�f�(�/�` ]8 
]�<`l��H޸/;�/���ٓ!W��G&,pD5�#մ9<ޛ~��c2,�H���M٤L)� 	�~��#�oV�z��\�;�Ru�#w=r�G.��������=��wx�q��x�o��a�|�������K���疽�`��/�Yk���v}��ć��a+����9�����.�_���-.fc=F�K޽��5�i�mV��S���tAO�����@�o≿��=M�7�Z����:�	�Q0ꝽuΨ�br�Y�n�\Agn�'����s�Yh��?~ύG����Ή^x'�%�h8����lۼ�k��[Vc5�r�1
���p����Ɍ�\�U��T<f��(��'~bVb%�`1������)D0�pw���O�K��8�A����U�`�
�����Nf`���SV���6p �晗��2Xܭms���<[4۱]��gm���O٧��M�*�6��͐��/��,0\���չ��rg����ܧr�[d6���t�s�\�.�4[����6�+��t�י|��2��Y[�\{�u�<k'�k����	LG� ���:��{|r�O��ɝ#}�r�_.���؊�4M�4EM�C��_F�e �RUw���l�5���eX5�����]X����Z�S8MQ���(���#X�XƲ���Q;��f`N�����W���Ĩ'�ЏW��52#s9ٕ��+Wd*��Ǟ�,v�����y�������u�m��A�x��1��8�������������n�.�f���O�.>p�s1թN�O=���)��w)�=w(�=��7�&k�?��[�"�Y�9����4�<|4�0����gڅ�X�[8�����;��p8���d���L��\�7%S򓛎,���߹�n��������.0��
JUU5MS�j+W9��r.��1j+�]�T6tC'�B/t*:�0��W�*������~<���<;9���I���v� ��׿e����>��O���l�3~˸���1�3����u���o��1��s��	�Y�%�f��l6�}��t����%3m3$C2Ώ��8��8������|f<v��3���tNc4������ed���X�Ū����t�qU3"��$H�$A� ǘ���*h�S$#IRP(,��Ny�e^���P)��3ᝤ��x�a<N��!|�$�T�Z����|oV��mW���y���3}����ɻ�f�0���xw�����f:t~�O�c/���/��?8y>�u��P�����aU�Σ**���t���oJ��ze����?��=S)U�h��%,��}*#�] �(�����3~zs��CR��'�!r�p�3��:_}Tm��� �l�Y��AQ}Ia�Sɾx�l�����<=����� z�U�!e�y�'jQ<�F�#�h�F�h�_�]��
rt����bO�(�y��<}b��)��r
�?�t3���?����v,I���]��+h\�8���ы��,�S�f�6�=�Xn'��B�g7������:��˅G�0<�P�Ň��F�fnԽZ��t�5@���|���-�NƯ���!°rܷ"��
\!&nl�1trv��w�}l��І����s��־�gyQU�H�!H�y�Ť����5.�'��$A���R6�����0�V�3<��Zy�ڌ�%^ި.�	n��T���a��&�@��p�)�'�*��#����"eMO-P�j��|������l	��85���9G+�Q���pG�8��osob�JG(�/�` �J ��@ L`�R2�3���Ă�7h� ���ELVדf����;V\�)/W��}��_��Px�8 ���B�H��~2��)6���N�fW���]e�����h�1��-2�!���ehESH�e-��L^�P��O��e!�X:	'`C@#��8�7� �0K4��:(�9H �< �h� ��
���
�Y�>�y��_�����k����\,娣�`4���TL���O|�N��Jn�0S0����%�x�x�Z&��K3��J��ox���e�a,9���c&a#M��`�q��L�Df�� �c��c�6�h�C�?��`Qei�଄~|�����#7� ��� �� �ZB���DtP��8�B��R����!��+DB��%�!"s��"%9F(�*�**�1R,!f��t0Z��Jr,�X�AF�)B��bG=�����y�A �a���3"��� �A0x�_����xF��fX�F;щF[�1�I	��ra�[��Ak���tL��q��qf��a �1b����
}�Y��U�
�q
�B�Q 8~@O������R(����	W;��n�&\̈́L�z	�pu���� wL�D���X&@.�B��r�A�jƭ�q�d��ԭf���V��U5���n��_�����ү7����~���~�r�!���W~��W~��W~M�W!�"��������V{�*�[�q�ܪ�[�q�F�:t�?��*�W��U-|����W}�=�U��|U��_M�T�,U0K��Re��V3�:����R�U�6vE����榪^���ԧ_��ӯ���]U�k_�p�J��X�S��R�Ȯ���uV4g�:뙳>�����Ykkm����Y�ӯa~��_�`�[�U��@�K����@�<P�Ԫ��@�I�z����%p+	�:�"�u
]��5
]���	]�е	]��u	]��	]�����Et%��]��
D�7躢���ӵϮ|v�vճk�]��zg�׮vv��+�]߮sv��k�]�쪭U����V4���z�Z�Xkk%c�Sk�ֺf�^�U�X�Ɗf�Pc=3֧]��Ů�]�ؕ����:�YC0�fmd���"�Ȭ������>v�Ǯ����j����U�j��C����+~��n�b���+�)��U5���h����ӫ�&�iT��[��z��ͯP��9M�~��LA���kjeCW(�:�{ʅ{������+M��*�]Um��6�c�[���j�21�-�T�O���Z���L߸�O���V�v�����J�k�B���:�k�2���&�+�y-�+_���W ������|��+�_�_����W<�������_��J����_���W8�j���k�������]�ص�]��uj�l�5�z�돱�k���뎱0Vc�1V����g�����`��j]K�+	t��H�:�X�kb�B�O��	�6!V&ĺ�X�+b=B�G�ZD�D�:D�A�
D�+bU���g�|ƺ�U�X��X��5V;c�3V:c}c�3V9c�3V8c�nU�[M�VѸUw�g�¬O��	�6aV&̺�Y�0+f=���Y��u�Y��(�YU�:��9+��ng�s�<g�s�;g}���Y뜕�Y�Y�U�Y��Y����~S7�:E1mC�F+C1.\/1���K�>xd�"�6t�_��*]��L��I������&W���N��l�5��B��e�D�0+��]�8U+�j�)�z�4QT�[�Xk����R�����k�)�U��f޳+���3Mb�V�j^Q$z��B�W��z�b�vY�	Q*k�`W�����x}�J�V�z���5n�oچ[��M3bu�bu"V+�u�N�V)��[�p�nu­M��	�.��$܊�[��fqk�q��q+���Uŭsk���y��V=o��V<o��V;o��V:o}o��V9o��V8oBG-4���Z�3���f��Bg�Э��b��,��B�Yh0�e��f�Ĭ����.b�C�څY_�u��2kf�¬S�UN�X[0�
f�d�������@d�P "��Hi��R��3��"��--��4� B�Є�ۉO�#�MW�XH-�l-�\��!j�hVv�Ȏ�K�;W' C�%����}�L�i7����� qN���p��$;FÚ�,�&ό�W+YR����Iw@(�j�R��<��;R�.��Y*YM�Z:�H��O�����׮��z�O7�n?��#��O$���^���T�w��k�t�#ħuP&��t�@O]M=�)�>U�I*۾V��r/�%m�y�����n����У��t�������;����
��{��<�^�КT?c�;T(�/�` UL ��� LPܕ�	 

C\q�|H��R@�)���!ٔ������8+�5^.Ӎ�����?��H<�Zk������vS�.�m�\��Yp�)7�rWM�W�}�o+���o3�i�ʾR�N��j�Vm�U�j�V]�Ui�A��Ui�;�֪_��զ����-��E���6��M�fS����Z����k4���b}�X[Q��(ͧh.E�2ͣhE�'�;Ѽ��Lh+Q�$��D5#�ќ��C4��o ���o1}���	}��w	}o雄�E�[K��R�����J�O�>�慨��v�7S�M�f���������&�l#�=��B�]���tvPguv����lXg�:��
ʽs/��k5��t�L.D�+垪N���E͉�i>ԼHs"̓�5�|�9���Z�����vg��	s.:[M�͐���Y�[M�i��i�Ds2}O57j^Է�<V?a�L���}0���\4Ǣ�%�-DeO5k�1Q��H�vU�Y��V�A�b �m��5xf4(�j���^��rg��A���`�`�`��l�j����*xC�-T�E*�HeU6Pe��ʆU���]-��e�&�}rj{�A��@�0p�j1�'�f�����L;m��vH5�����V��h��gwA�,���@PQM�[*����?`.s0��0���<̿`��7`n�5`N�3`����k��W�=���ms�;|c���W��
�`>�`� �
`n �Q�C���݄o�= ����	�M��	v��J�[	���;	v#a�v�n#�.�n"��� ���@����>� v����`΃��>0��_��0/�{4ףy6�����hNG��|��r4��9���o4w�yͷv��|��j4O�����g47�9ͯ��i�E��h��΢�X4�����4ס9��_�{i.C����\��)4G�}EJs�7�<J��$͑�5G��H�*����l�,��r�Qn5ʝF��r�Q�3�mF��(��r_}�����B��x�N�n3F�.j�փ�R=C����� w�F�T�A��@�����-�}��K�nc��p��� �9@�+�=������ �3@mp�ܮ��Tp�ܞ �%�mp[�6 ��p
��P�	��P� � ���6j7An&�- r+An%�NB�$ȍ��G�}�������[���[r!�r  7����=�̓�;���s�{����{t[�ng���ݮ��tt�u{�n���8��u�n��m7��F��r���kt���Fgk��Fg���ft6�����:�Mgw���W4?�܊�U4��{����L�Q�E�O��D�M�̈́�N��H�3��"�&��!�ӷ̓hDs1�x���Sm���_����2T��j�Pm��B�Qh~Bs���|Ks���\��j;P����4�j����4�j��Is��M�3i���R� ����H�>�6�j�MT�F*;S0k�*�iH�R�QOPO |~��)"4���IMр�q"5��j	0�!NG��ө����щa��T��$�BL����j���pں�����8�ʙ#$�&WO� 8���a��')
$W���D\ha���A	?^�a� 1_���jRRB�A����N�'�ONs�C���AZlM��X\������ Ť;�)V�Vk��2a�%0XYX���ӃD��Ӕ%����x`d9`Iʒ?���P�D�K�%^H�@��.R>EK�,����*NFMFYRZX���2�T�(\�|����&&�@��!C��Ģ�������b1��!C�
�2dHMPPNOIA@Bb�#��$�'��� !���Z	8=���`K��v~�>v����I'(+	X���b&(	Ti������L���l�y�p�B[`���ni��U���ZG�@*�Z�2�Ohy��c }U[|T{A5�Z^��	9.z�jzf3ݖ��a��9����m�k�7����6��M�^ӫ�z��D���6ݺ����:�L����K�eh��^��*�;�v\��v;����]w�v#����H�}�Q�F��[��"}�;�o�������(��2F@���̈��z0B)E��"S"�223"A������{��߆�֩�zq.&�0���ˈ�!�5ƺ�����T��o��t�ZM�f�p,j��R��]��qwpB՟�`0���}ty�K��u��c�� 4E��z��-�k�>Iʇ�8�~�0A�b��W��}����b��QŇ��cD��5{0��-��`�p�����������D�d7��%2�A��YhLt��A�R����[4ׇRە������V\���,�B:���PŇM3��%�����1�myȶ�71gOSI�ԋy0�� �S�����UH��1�0w��U}V�E~8�lB��y��O�'��{�(�/�` �< jeXH�^m� 3(�tN@z��`�}�� 2�F�i.�t Q��x�?w�~|x�M�V��h��V�������%�MD��2�>AN@bi,I�����^��"�Q���^�c������RIu�)Mԕ��$�W��o��s����L��[8{3,�N$��
Ww���u����8��*�"������C<��A���n�/_�����ǭ�M�O�EE�BB+D���v!ʅȀWwtAϰ�Ew˪�.g�mY4֢���`{4O3��E��S��9����>�J~�?N2�D�<?��_���'��������I����^~~�{*מ���|����_O�rN�8�Lz����>$������<�[w�>�:2�p�ՕG�_�D�!���$�M����ҔG��tݲ)<
nf_���Zӵ�{�rP��G����k��١@���]���c�E�w��6�=���X��4�/U��c��rq���:S�e��F�z��1�V/6V%OV ̓E�f.�쎵�k�٬�,�t�t����$�ݝ��{����?��_�:p��^��`w���<>��y��4]��2I܌�C5X0�fkp�B��@�P�Q���2͖x�"@DS~�������lˢn��˕j;+���Z�J_���
�f����8��z��萧k��g����b0�O��`J�	�x����s:����������<����L��1������șo9\�h��J����Y��������3����KX�$0mh���x�����A�ag����~���=�7Yv��}k����ַ|�/�5���H��c���z]y˫������<r���f��||�9\���*�FS!b��Њ;�E�n����a�Di�?����v�g���iе�
���ǧ2v��w�OiP��T#��X���Hߣ�S,HGw$#�;�T[��Ì����:��p���J1��eM��su��mg�,j�@J����ӗ�'���������{���v_����\��h����
b����^��)��d�f�n7K�фDG�F��
���d,~{w�B�Y&v��~q ;>���o3���8�i� �ݽ胰�6�$�R,����,n#\Uawci�&J��+}�$�Ö��O�����oS��K��o���$x8�����G�&緵o׺���>�T.�p&a��!�R���yӴ�l]z�_v�?�7�
���#�)zT���ḪF�l�j�͡6�f��Y���j��
��T�'���$����8����~f�6��s�2,��@>�Ϲ����p���ڿy���1��$|��2�d%5����	`����O�,���nNc��`����'& 4k_����=V�,_����4���$I�q�C4�v�,�#$"""�H�$i�DK����Y�Sd��z9k�̅�=BN}	�^w�,�"��J}C���=�D>�އ�����@S���k������h�0��^5�����lÉ�����P� zN2�GW��B��~��9vhc�E��� v6�KR�c�G������~fߕ����㬜t�)l�usa�S�c�?6Kz�����N��]�jŃ�Q��bDQ�L�Lpi_GzS,ӏ��:��)6�d��$ti�F?@�DW޻�6�ge��v�[��l�;��+8���><�fn�]8�3��b9C��C�E_Kwa��.�*D�p@qư�~'m�Ok�Il$�3���Q�̴�`�~�H��>g���x{;	*��\��Q�A�M3t�\��8V�5-E7�����b�3�I���I��g�1���Y҉��
��{FcA�����'|���X=rȖ���z�U��4����%D�"F�a�Ia�0�{	>�yy�9����5L�= 4���ȴ���=�\I���<'�5�q9 ��i�~8�(� sAY8<X8$1bO(�/�` ]F �xTDpjQ��GĖP���8KCݑ���ྭ�ն���� �zGj��3U<ٰ��id�]QA+c�{K�R
~����0 ����r#�&q��oom[�v{͘m߽uR�y܃-q?$� eQ�oD��Y�Kz0�م�)kYwcY�ھ���)�v��ݾ��!�5�e���w�	O
��fd�)�\bR�E0l)c�yX%_ �L�����}`��)���S.���pz\j,N�:��M��b/�/�g, �K�s!�K���b�Qw�蝵M�����k��տ{��Ԫ��w��lY�O䂄�{�X#��y�Iw>�na?�x|Ĳ{�lq���ɉ����ch>�q�m��N+��ִ�a�xw�7''
T\�G��E��C�u�����p�ƅ���Io̙�/S��ӝn�}j.ž,��-�l��t5�ܪ�e���"�{�*w��v��k�E�ı>=����oo��0��k��Yz\*duQ�.2�{j,��njPJw��o?�Ѫ���-ԟݭ��>����T���rHWZ.���e�\�b��fՖsX��m/��!�kuU;�Ml)�|$r�f�&4�o�X����[�N�������2���ŋ/4Ԟ�Ʌ���)Q�9��T�JL�*Lµ|�[�r�]7F1�!�U��{��p�e}l���3kX��o�|�w�Q�TX��(�υDr!�Ya�g={��?^�����`�:����?y���؍@�_�(�.'�3NcE����Ɲj�0���x�?��iu��J	V��H�u�4h����Y%F���c��	�ܗ��۔U����|h�UZ�H� #�P�c�"���R
�ݙ� q����;}���%��`�j�� 6ь�Z���k�ZZ�;��RaCw�D��H�� A������i�P͵�5���*���������ŴZ'��w�-�; ���bXX'��P&���B�D�s�\.����������Yn�[�y����ӧ��ű3}7�����?�g�X�P��z�M[���m�Jk�Cm��M����',�7�Ir�CV�j˹G�n�f'?�g�m5�S,�k�\�����s��Gr��ѣ�
�ެzCQ���n����oM��Gi�@��Ŕ�Y*kV���`03�n����]!#b�|"\V�7! l���F8���i��5\'���-e�F���.y��X��a�H�З��6ɻ-��X�0H��r�YtqlhF�]3�Z89՘�fL?��]���y�ݡ�5����w�f����n�.i(��`�v�'or��-Ɖ�h��أp��`�:�c�n����;9uu�q�pXc�yn8��T�̷�2��J�&��v%��?e��1|c��ʯ�
+V?5�voG��E���I.�a��o)=�X	t�e��C�~!8t�Jӭ1�J�!R�d�# F�ٌg�h���2�J���#`��әB6�����-w���D����6uR��/f���/Q�p��'n��i���ʒ��+VJ*�͊��l2�^�7Ո��@�b5�*[�G��{[Y��"��v�M��6����'n�O��)�m��)���#*�e|<o����q-й+˔�X���Ft��f��h������Z}"̂-���(g�T7���0&2C"""2�$��-�v�MJ"�)IQJ
�� `�R��"x}�6�i�@�VH�j��<�<��~39��B�t+xxŃC��P-C���τn�@��?��>���<+;_�;H���A��S��t d�p���2���]��
��YhbU��b�
aX9����K�h{	q��?.�?�u��M)A�Q�-@�8:p!��{4u�
�g�����d���IZ6P��u[���ڂ���/����5���i���r�?D45��X���{Β^�٥���~�̎��ψ()B�DX��?<~\��G9���$c�u�������
�QOdȫG�a�n ;C����-�i�U�}*����w�I�̔��[`Ԉ<扗�
D��@)A9Qs�.�t[W�2�<9U�������|bJ�fK�ŗ<z�y?*���M��4�>�����C��:9g1��8M(�+�NnXڕ#m \�^=���9������ɶ���
W�;�fl�v���v�h�ོ�yL�U�K�Z͑�!Kk�-�����w�x�Q�e��?Z��j��ڲ����� �d��MR���ETi���0Rn��g�`�2�3dK���P�Y5(�/�` ]> jj K�Zqďy^�A7�=59�Phʱl���+MѲ��8L�ϗ,m�8�2ݵ�~h��M�u����&�M�L)XdX�=,�M^pY����%���6���Q(�PD��63(f�8�������w�n��$�t�S��,I�Khw	J��)(#�sB �[���2r���@�-e��P��W�+V˭�4��?�F~9��{�Gw�?����)���S�Q��_!U��!�Gy�g�~(�����Ž�l����m����A�̫��b��LE.2�~7�iv��!0���YY�ض��e)��*08�ۖG��>e^����r���鵮?����\r�}h����ٛ��I�i����ı��:��8n�.U2ݟb�Y��S�`�ĲIF�85E\Qc�B���HIqAo5Eq��e�,^��l< .	J=*FI����5&^ ��M%NA�� �&L��%�v�V+��hjm� �C�a*�1��N���T��X�ɡ��bn�c�ػn3ծm�l:�����K�iZ��&��Ckξ��ћ�����č䘛yq�� ~�?�9εw�2�*�GW�dMV,�$��:i�><q
J	�8ė�8��(�Z��Z��'(�[MSE ��!�"`��M.���-�Y�l��
��%�V������G�/!�]k��z��jz��L
3��;_]L�(��]��'�qVq�Ϸ�h�4z�/�4T`8d7�m�U��ݫckz���_���H)�&�9�#Y���������GE3TAE#��8��ϼ�R�.���z�Ğ���� xb$�=_��Ӿh�#b��a��Xv����K^��,o�b2w���ɡ��+�8�����]�}���<.s�G�7�K�VH=I�#�G�1f�K��$Qfn|�	w��w�
dվ��DY-��+��d3�w��v���F#!!!�9{��o+��^a�<@|T�R݈�4�_|T˫��e�M���k�g9�l|T�Rx�לJ������d(�Ja?�j�a�t�r�,������vtt.r�C`�Gض���\=�����B8���G'` ��:#!�(ɳ$=I >��[M�K�^�'y�. >*�Q����;��&t�Q_9rI�`nr���ֶWTuv[޺�����QU ��n��o�咭�����o����ƫ�-ߥ���C�����.G����j41R
ǉo+'�ܨ�m���|W�gm�$=Nv����6c���GB���0�5�W7\n�4K7��-�K�m�!�)xEEғV��̒#�^9?��Ԙ	r�,Z�䖄��r�d�}����Ht������8�}�M�벱��BY�W���D�=�Vp���<�P�o'ߵ��G��z�1�p^6:H̘:�+V����",�~����|m{|���3,&��_ƍo���;Uɾ`(!���	R�}��'��#9npL�om�t�ky�]2��;��i��Su�ѝ��Ψ�,�##C""B�$Ip��� y�@
!f�A�	HD��¤�0l5�%<k�m<����}�S���HNI����� �+s!H��^o N���q��Q���x�M#�#����H�5��u�����B��Oh���nnT���d�ӛ��M
,G_4i���/�
�~�1&���}:��v�ao"8N{�6�7 n�M{t��V��y�����=��+�=S�'�{)2̄:���#�d�S�p��&��"S8��y������t�B��=�RH4�r����0�6dZ ���k��`؀�� �B���gʏ�(���yī�"��l�����~V������wZ?�:��頌�R��*OX�|�8�X��I���?ť���'?��'�%�P���B���� ��zs�/����u�7]���L��	���b���skO�w��=`
-��cM��3H(ٚ��ن���1H����*L0/`�������̀/�C��14�c~(�/�` �? �i�H��qC̖����l�)����%	���6b\��-�^dnI��iY����ȯ���f���he"��?��ƙػ�e��2�]W[A�l�9�A���A�. U@IYj����$�Ȇ��mѽ�rLoS��M�p۾��9�m�joCF;q��9O�:U�ٸ�Ԫ��Qg��e��^���;0��҉Es~�V����=�x�L��,���}���Wr�n��n��&����ΗK���P !�x��W˒���5u�O�6�GB/p�s��7��$�NZ:�uɴ���rKE��n��r:]��l�K���1� ��+� �&��0���y��c��GHI�H���ci�G�����=�4�tӍ����_��$7�.���,w�]&�AK�+ă*`���~�������	=���r?qG[X�0�@��b����	E#VE8�Q���L�P7cU��S@� U��U^�sŽ�M�G��ɒ�����e�taL%�#%ܧ�Gf6�w	z,�{0�=0��BDǏڼj��ˏD�<��j�O��Y��,R��=ч�YW�Rci��q�WO�K�\�E�/��bVR��H1�"�]����Ma�mQ\���"{ko����_�i�ɬ���r&f���j9+R�����Y���Df#y�o��Q�Di�",��U�O������뻶[n��{'�qwG�*��1�٭�����3o��y+���-�d��<�kL�2�Bp��i�C�6mi�"_��c��[埸�ۓ9g���)0p���r�����Q4��|	�t�,S&�c�p"u�����IBR��-lo�-�NUUiNs��Y���7�ܳ6v���<��$��&]����O��m��Q?�p�׼Kg�R��:M^�r꟔ɜ�
�VR(�lr��֭��^�yMU5�y�ݳyS/�������Fi�8�k���;n��o��E��i�PAb���g��[Qw{o���6\��j�~L����Y��g���e`L?�^x�$��0J�� �
	W$pPT� A��)��ڦ��#SSS���mu9�����Sלn�멷[\��m�〚'��˶N���7SIŢ6��S����UdN�_!p�~���q��|��,#�mY._�PK"��U�Z�T�ŋ+�=�f!�7&����^h$?o���bq7���~�/^oHAy�A/����YE��"�h4��pB��� �D,���D4�2qĀ�\d*���M��Q�u���ꆹ��{��2���ٹ@�������
�?�i�y��0�!��=o����9�����'������h�f�h��<�|�����ԘJJ'���A��q�_�oU��Iu�ZS,�m\Q/%M�ts)~��w�K/ya�&�Y̙!�4Z~��`��ի�m�ۦMMUdV�ʵvc�����Of5���Z��.߷P��������tU�,S��ڇb��8ͻt�15�**/o~��%Vزm %M�U���ӽ����vs��<���8�	D$I�1D`�P��cI
A$#C4##)(�$��O g�G�����H@���Z�j��
6���j�R��h�WJ�0a�[�K�R3r��	�ȱ�̰%1-,!�$۟EY��R�(�Xrx�gv^�"�y��π���&ƣǨ�a�-��Lҕ��2��4�=��,0�>^`W�	Ϝ�%�m�����
8�y�y��N}^�}2�K�8tf�˘663����z�:��}'��1��%��p��~<���x���e�1k���[�@����y�i�ѥ�*zi�_�|��N�<�P�j�s'�/�>�V���l�-��ja-.Jt�_��m8�s:TD�$s9A5k#RD��`�o<6�Mc^�fcx��_	G����ë�i�D.,po��s�^�>�	e���K��l7Ꮇ�QN��b�r�Є��A�N���6$�<��z�7N7��.�-w@M(+�7���{F���d����@~r=�ǖS�HxST�f�7!����LG�3�H�N|�)�De<��r>��A����������<ם[�AAaI�j��R��*�</Ғ�pL8�w(�/�` �D �w�J�\q��r��}}������+V�%�ܳ9W��:TDP�\4R�TIj������mE ��Y�����n�����DD�L)���X:p
P�wz<�l�h�&���|�xZ��ef��O�M \9���+F����<���9�p��D�C�7=��|\�W��R�s��D����
��1l�;/����e*����fIK?���U��q4˝��0��[}�i�@]�/����pr\�PH����ڃ��PPPgI��� ���'��IW�i��n��r�T�$[d��ON;*%[S���bjs�Q*��YÁ��t��9�%�d�-��i[[���mi,�w|��{�=��oԔ�䔣R"�E-l�Fz(_&�ֹ�YP���l���Mݲ	�E�p\C&�S�$ٔ�Y��,���ɱ�q�{I<O�#�~k��T�*��YYݾ U*�I�n�c���w�����~�H���?aY�\T\pl���ق��f8�Zk��R")���ɗꜽ�f�ޖ���Yʹ=6�OU�E#>9�TJ5�h[=�-���H�$4���s�A%�q[8qb�]���nfy��<;�����L�8��8�n��S���d/=��6��b�P�:���f���z͊�.O��պQc�
<ؠ������T���z�r���C+���&��u�禫��� 0�?��m�z��n��l�k�'��q����,���E������<;�E�ѶF�"�]f�j�E <�ac�P��J��.�tu��͕��~Z�@ 	s����h��ũ��;ҧ������n�ʶ��Q���dj�[�s�$��\�ߞ�k��%bQ�����������&�)(_Fw��0ȖGX2Ug�%S�#S�:?�Cw�4� ;��P�ǄF�+��;EL�*�(Ő#*>�GRÛ�/6wY����:�f�&��t��f��������;���=%���F��&�p/��a�C�&v*�G�x���6A(e�����g��:�B����"
Z"���5��?�{wni��UU����1p�[�<KםN���}��[FR������,y��Ӽf��_e�^�����(9.:B�?�i�H�D��gk*l!��J_>>J,��o�M�T��npU_��m�j`61ٌ��k�ֳ�����$+��i�Rm���p�y�w񳿓�G�2����v�4?���_� �붭^�'�������h��-���y봁����؄�\l�g���^���$�*RQI�Ӝf�� ab���t -(�xt�r�a�@R���A�ʀ� �H>A=���	@�sICaa0zq���k�����t����F�j&�8�m�'���g|w�|�)������Y��i\#��Ge��� k��f9wD����1`��d�J��!h� �7]pQ�w3O�qg��jw7���t����g���^��_j���w�Xp'V =�i$1�X��=�:QU�+��^X�3g��"�#���vvU�_e����D�����i��F�Pċ�H[�B@қ,30�*MU��9f��5$�����?��o��o��&��+ή���io�[���$����o�7�.�r�]������K#ٮ㤻�{�G�= J�~;
���I3ٓ�m�:ӷ��3��K�l�~/	�����0����I�B� 3AKҘS���(L�B�90JE�~ߒ��5b�J�+V��(��@L-�h�%��@��(݅� ��rz�)��3C%9�ѽXΡ��aqf�'!���E�i?���Cn $�"w����D���5/�2� ��)W���L�Lc!W��OP���=ce��VՔ�N��(_��!����Z����Ow~ 7,�����o�j�}&�?Է ��� q�t��*�~�+�#��A��m+��\g�1[��,8r�8�8U�F�,�ٞ�+����I<�UmӜ1�f[r���WC`
�!@����������?fZ]���
������i�Ԝ�$ß̊a;<���ig=py�ax��'58Ϻ�p�C�{�߉5�6�;����[�\΂�g(�����$D:jD��Ei�.�Ⱦ��Ll_/�llBkT�d1�����!�(���v��j��zK�h?�0�;��a/N䶱y_i�j�U��l��F�G� ����4O��B`��E	K���g�����g�f�]mU���R(�/�` UE Zu�I�\qAD,��8B��5��4* ��6���+�Rk)(��� "��к����Bk�ԭ���w�f����uwo�R
et��z5y{�l�`^�z��x�����鲧V�?���q�g�w�y�=�ܟ5�����s@6��m_�o��n6��g�)v;��?��Juoy7��E��w[���v�n1����ɛ�7�\8bϗ����:w�ki�z�nW(��f��i����O����kd,q��#� �cmp �^~j��@4�������r�Eg(o�c��n<��$K���{*Ӳ��I%ɮ"M�������-,�f9`�/ͦ7K_I�a1�C�e{߮<�f`�s8N���{������Z����<�uQZ�΄n'����'O�=;ݺ�����?&k�w�����A-���n���m��<k�n����n���8U�vX�6$�� �A�/�{y�i�(�=Maꂧ�*w��=�mY�S�ޞ�K�k�N~�k��[S�m�x�w�;��c�O��ij%��C�@ �,Q$S5�d�F���^�ñ�)_9Q/��:����R�z�Mp��ø���\�+ЅxN�]��|f<����dUn���tR�?�U��&����r���O�ߵ�K�^�.�à�rd�\�AW�����'m��a�D���3Y�'��[�[�z롼�M�g���`��ZM�������~�t1fqp�������x7
l���$�Ѩ�=�=��z�o�&��g箑[�f���L�^K'�4E=���_����_��,<�c9�9�Qr����+%Tٝe�p&d;3���Nji�~���E�"�����1$�b�n�'��"�� `Zn�¤\@ �B�"�oi�H�����!jg�((���U����:�B��
z{�^Oώ$�;S�NS���~&o����a;`�k]�����j�U��U�k:m[Y1)Y!����\����'E6*�(r�uH�?�{�*t!�i�AB��9k{r��O��v�n��v{m(o5�d�3 YN�i �\�#��:41��?�M���|��B��O��WӦU�{L��$�3�N�>�	aa~����8&FA !Di a�.��\�XH/n�k[��EE!*L�(*1�J3y�k�z���jF���B�ӌy�O��hk�}j�K��{Wy�h\�z����j���y��L'L(ra�W�����d-�L�,^@��_F��(4
�/X
�g�mڢ5M�$���)�J��!L��3����7W�VS�l}���5-3�������97�?&c�w���i��{>�2�]8H�p|���1�*�����<�m_;�� ���4|��@5��z<wu��,���t�O���g���W��M9������I�*��s��қ_�{���SR
��j��(�ki�S�y`�B�f1a��+,!,�����z�wȨ�*	�&�~��ݰv�3˔�l(J�R׀��p����4y3�G
�Z�=M��<:>�ӧ+g�Vco���;���w�g�����������UM����_��0�U>��g��RP8�?�f�[��G=�>��c>�*��,�B3"""IA�tQ��($-�@d-M�*Ҥ� i?��@`*���4�F�t_5ņ����&4��b���	�wey�&'	�>���dX��r�Q�o ��s�߿;�����WZ<��Bu����f�mקs�V�POb~JmU�&�ۉ�'��
Jv���%�)�̞��)qV`������H�92��X3�������2ɭrǚ��k��h��9�'�G���E�I9hQ!>m��y!�	�!�V�q�z��ɣ�/�'���OH�̼�&?S\$�p�O��:��>k>�̡�<��w� ���͢�:h�Vmo��U��V�!Ne��]�/�XP�����`ޙi+��{��8�޹��0��~�^�IS��SQ!f!�w[%�oUǯ�l����e��a�-#.�2������{�j{�X��A&�L���܍ , �O|#��xO�%��k��4�!�q�g�]��o/̕4�=���<�_�D黀�bL�D���#�*2�_����s���Gc�_7٘���o��SN�@�<��:��eY�qm��]v��Q甭�k����iЕGjpܗ����xt���U[Tm�|~l�٨���6)�T�T���F�@U~���t�(�/�` mK :��VpV�����^[]���X��ܲ}>~��}���F��r��G����AѭͰ����_��$�����щ �=��D�Q�aaE��Ȗ2������w��g����a�����j�(n�����F8�'�ϒE&QV#��� �~BIF�DO���V�X$������A��2o0�s��7�Qu4c:��t��NG�7�_Ȕf  q��X��Ysku񰊙m�wX�W�O�i�����?�WNs/��N�q�Z�k@�8/��~��b�GfcJG�Cb��Ç���ԨÎ���G� �O
�JK&�rÁ� ���(f�ng��nX���y�J3�����X�fv:�\�f���n����n4�F���~��?���i�<c�0R�
s�q���z��+�5b�e��D��:꩜8���f��p��4�^K'qT 3=7���&@�T�E.�g�ө�:�7�~�
�(�yZ��v���A�����܌:��YqG9�6¿��5x���d��%�<�!�V��_��غ�����(�R�9�Ɂh{=3�@K7m$�� �R)$�T�e�I�PԕQ���Tmz�͖��ʱ,y�j��p�ZQE���JG���ᨦe!�	V%UR�����7�����������]/����[���W��noc��m<l�Eӳ7颎�d�rڗy���̊�̭!-Cz=#��E�%��Z���(E�8�����l8�q7���J��.8#g�q	�A������9����lU��)@�������z)�	�Z�7��x�Ռ�0����˿\;�~��% �&!"J����"E�rrrĜ�Ss�MvQƴ��]��\yHl��V�	=��d2}���������{�mum���ħ�npQ���ʄ�m��E��>��Y��+����
�H��95����,Cs��QW���*�`��ƔF�(���VfgX���x=B2��aB�J�/�g[z`o���̾�CB��}~!�&����2�ѱ�ǭd�mN�X�x���7�14����A���B���t�^f�8R�(G�r�i�������8�c�{��>�@���u:�X�vt�h��_��s��s,�F(��L끍 @+I\D/�p�e0��*}"�͘ѓ�*9�c:���9��t4�vQ�ؒ��=��z�H��@&��t�ax@�wJ �9�au��O+<��3�q�eFן��(G���ދ�ї/��E7�$�8KI���;aɒ�	8x���%>az����5Yr)�G��cU��v�|k��O�i��������`1�*^"�iK�Pqq��&�P"�e���*���e���%G�;��s�0��k�]����lM����M�R.HP���Z2%��)���D�)@ ��[?8j𠍩�ɕ�ZV����1�(E����h��d�y�h�^ldjtt�İ���*�pM���3��������P`������y���w!: �m3�����Yw�v'm'�XD4����.����k�����KLy��1䆌�.֚�r����c1�k�$�v��-��|�Ⱥ�����1��)�H�CMd�A����z{yx�s�Ṷ~�.���5���P!�z`�	�	����%��\2%G�(QBD���J����Js5÷�Q�:xϔe$�()<�2?���9����;i�ԛ���������ᓦ>;���J�j#CK��jF��fi�|k���FkA��x��G�!�۞O��u��A�c�x��5E��ʉ���R+6r�8&MU�J)mc(d���ML,f5�t1�	 ɪ��fvahKG.#T�y[�N/~�"
i���4%2"""#"�$MQ�(�$U=9�PQI
Rv�\�2i;����u~e�LcD����0C;����Lr{�O*��iv8X�q�vq�vOl_�B�d��<'GdNM��x+&2�����$|�#)��%n���K�!�����d�F6�ҝu�0dL�����H	��'e6�rɯ{F�[��~����="���x�&�"[S�h��~�w�7T� ྲ��;���q�����@wEn�g��k�_�� ���*���1
[�D۸�e�;K"�VsO�q2������k���&���%�U+�ld+�'�f�8w��P=��!G<��
����ީ�C��ڢ���l���@�����dF�6k�I�����?���i��y�^��H��v�SgO/�}�^�_�,������=0�P�iy��DYzm��x�j���n'��O�/�꣱_�9��
ܽn֢H����)I��2l,"�O���B�|\�UP�G)�=�y'[p^rɧ"8�ƅ4;�ܢ��_����Q=��NN�k_��䒕__���(�/�` L ��8TP��;_�_b݅e�!��	�"sr���3Y�n����O8�Sp�Qz�(�5��Ă�H�h��w��x�̀�=�oC<�o7!R����\�A�Q�͗�$oiH���u^��ڱ>^O��������uO(�O��X
����xp9���D�(�)�dlq|�r�M�:~;����h��] ʄ�D��`2��
O[�f�+�eI����P��#�d>��_���t���<m���4kB��a#�i�E �`�rA6��Lf��b,5P -����Y��dx*RtzǾ^�{}����E_;�x=ٽ7���r2�l����!��H��)�أ�d1l��EqdZ(��C^q3���s�}��i1����%-�"
���1�X*�N&���#E*�B�vx�D�3��K�ڱ�3������|�W�So)�ʭ�;�ֲ�������G��r/��o�̯�{��4L&�:��.���`�h���%$ڂ1],��SC��=���z�^��UvMeY����J�R*Eԭ�����~3�����'�<���W�M]u�q��T�Y�ť#�Ԉ��I
��G��4��\�Y`��L=���E��A JP
*��tOM��(7-�� Z� r���.	�0a��b��&���K���O�T�%���K��\��ٲ!;r�ȕ�z�L�����rl�n��#;A0$��?L~;H=�����4W�%o4r8��aLB�g��CF�"�>�_OE/�d����=	p��*�L�NWD'�)G$Qk�H�c'I�&��T��ғ��t�/]�c��u94�X�
C���r��3�S�O�_;�FM��ڠ��B��iɶ�
�]�D�b�Py�D��W�[�
@`�
:�C`��Bc�WP�p�
�,6�ӑd�S�:gX��JDz7�:??�:mk2��7|sb� �����]�l};�iL�1	�S:;|�PC���4a�J�5�L��A��gy<����U�Swr�`ސ���A)r�H(��1��C�h6�f��(��W"����%[��_Ӊ<�?I�~FFF.%,���c6�����"�����:$���p���� ���a��o�O�������k�"���Ӌ|a����1b �������p��>�OC�u��-]���'۲X?��|��������@m_�F==J�Pj�t��<3v-2�Y�|I�=���z�ɫ�D�*S�R���Jı��Ϭ�l~�Ft��duTu�]>r3�KS�8�*S�Cc�Br2� ��ЧȈ�J�p1�[�=���pV�
���O�c#��|#��Bg����u�r?���D���QG>?���etW�L�N�  W��!���Q�4�M���j��?m�\c�'=_�l�+�*��X�h��:@@���=��fDq ��(0e���(-����t���_�a<������4�?ʴb���C�:Fy�����b�	�'�z��� ��)Eg3����5���=�`�'<'BZd,)���n�J�c�s=_-Z�8�IRRR��!�h)���VA��*�k��P)���*zUy��jD-X����-ۦ-۶��u�/��>;�Vc��Z(���[$����j�Tr:��T�����O�6�=L���ђݎ�Q-ak0!��= ��p �{��8 �)���^���mu����V���M��#yQ�͊����P�¶󇀀�����l��c �� �#��u�3��l��l�6�=����b��߰�1CFt��TdN`7)�K϶ע��$o��M�>R3��C�C&��c(~�lnV�g�I��H��ʂ"�tH���nR�,����I�c�#m��`�/���l��5�r9�a��h1Z�ň��8�=E�J!�?�s?d��U7~?�vW��($ͅ˔�8�LE�d	����KO�5W�Y�VI�/%a?|�G����x�,Y���ą��"�j��	r���l/l׀���0eR���b`���tE�����$�))*)���TtA��J�Sg �T\�ڔ�L��~*�t%D�E9�f3j]/7�`��,��w%FΌ6�,3��Cr�[���tYG�@ͯ�G>j��X@�zI��i��v�bVk����K���F�Nê�t���0�O�m:6"˻�޾׫E����"m�a'.�'�$��o�s���K�63�aX�y}�ck�ZÒ&�t���DM	�H�ZkU]��{6��2��"`��q�˲P���B.r��h���d��r{�����g��q���uR�B����mR�k��F�[q�8�P"YC~@�?��1�Q9D{��d~ₖ�X�n{�}�Jk�_�(�>�e���A�������o������)^�_)�e�}+p�a#�8��s�U(�/�` W J��#V`�Q�N����
H�:�&�1	��$�W"N!��縢���$pr�YܽK��xkV�]z *=�,U�6x��Qii��վ����R�";Y�ǃA*F�Pz���b.f��M���z���+���}���x8W��i.�_�rw"�����k�<�����O����x{Z��lK����J��
_�x�_�OO�]�ɒ�I+s��H�4���)���e^�������Od9���^�g�d��I��˶j�C�4Q����c�:���;����>_U�/	��p|���]o_�쉚����(��\I�;41+\wE��G����'�#F�?Y5�Eϭ���5�dYo׶��Uo����jb���6�cJ���g���(,s�9]���Zt���;�������ͽ`~I����#[����M�DѴl� A��y5�dV@��`�b-|�f����(�� ���z����I�Z��uy;���pin}OQ�^�+�A��'��OIy�=��y�`��Ty0×!xN-R䂗��-킯�����
�|�o��|���1�;��P�����{���E���ѹ�;����sq.��`��L«_�ҝ���ݍ���}e<�l�tw$���I I����Ǹ��;c�������2!�R�~���r1�hO�O��ۘ/�z�����N�hjj�`;~da �ר;��t*�f�F9��\��OR
N�P�a�LG�z��9��Ѯg�mm�z+r6�i�3�ɰ��H�䀕;�8Pãf뮥֩�[Y5O�k�mǲ���5N%W���N�\d����Z�v'�����mʣ�~$�1cg�#G�?uõv�1ܣ�%~(���G�?#�{��~OS����?����a��=��	)�Rd�[ϹX	|@�g`�X����hr%���|C�M�vY�`@|�VBfБ����k���Stey<�uU7W���Tm%IiTk���o�����������*���S��(�#hnv�KP)25���-={l�gٲ�o�s�Y^��NK��PT�[�r��(�o�mq��U����3κ�Y?ȯ��`��0I�(I�x��3eq��K��iמR�vk��}��9̢^z��q�Z��[�]˓8�q�x=�͵��rӃ���K��gy��s� ��(����T�-_0�_Ŀ���B�Y�,�Fx��=��9���pLybQc-����Q?O�z �k����s;Wgȉ�6|C3pV��a����%����q���H�E h����XA>J�R��Pԋ""CCD�^� :Rc��q�����t�N=k�î�Ž�m����Y嗞Z��j��لnr<>��uU��獍�6!w�L���	��WA�#5:��vѡ����{��ٗ		&�������?���w(������C�}�.\]�e9�-�i��=�����H!��-��%�~G, (���#�S��ղYI�Z�x���|�d|:d6>;�N-�͍L
LΧ#�,֓#�C��b� ��Q�XR/k�DQ,KS�g�Ptuw-�iW�qq�Z�C��{��Qf&˄�?�_͙���>�<���U�N�/
��L0�ɒ!D@�@�2��?��*�il�͡[�<��;�Z�Z.#��CdΎ��������9�〇�;�ӄ�G �Zm���V9M��[�	�T;VȤ�zz�����y���^��N
���t����0����L46Aln\V�J���95O��n�M���>7�wy�<�ug���	a���g�?�{ď|�]�II~d�� !@h��ZM�
T���Åx=���a��J�b<30婢�.�jlR�=�0��`���`�2��&�H&�5�&�ES=]����r1�zptb���&W��Hg��;֩�EU+6���̷��N�bw�+�_B�[�u#;O�4{j�N����z�\�U���T�UW�_Eu(�|��늨LW����45��)ʱ�_��1�%g��LH2)ED�3TX8�g\|~0��؝<` @'��1�D��I���w��G8cw�K��"�����>��{��1��%Ք<��n�X\� ���[{ �k 2~,-�Pz  �H�����S�r��V�"KV+E�����S_9��Wz��5v_��=h� �_�o��/��� 7����fܚ��w�����8R=q���#[�r�	+��u��]�#���N�/e<���㬑x(�~��0�f��a�k䧷|�Ʊ�634@��7� ��o����pPQ�?/D(�T��;Օő���'��n�Yo���F�Z�У�}t��̨�,g�Bd�	D& I�`��"�:��!E�:� a���O+j�A�j�pm�F���}�"��?���f<8��aIy�bs׎��z�pBb��<���	aq|�_u���тI�ø�u)�.�����i��L]�������(�D�kq��A���V�5<"R,�@��BUr� +�-\h&�je��9`iW��UlU��H 	���b�5U ͋WU�u�:�o���.v^*4N�h��ㆢPP"Ȕ��sY4�c]�,>V=���T$���rL��W�c |w�@�5Zr�����+� �q�.��.ټQ6_♋�d�i������^;
� �S;�D��E���ź<@� �|�h�iJR�ľ]1{/��7�Q�+��/j]!������ң����a*����1[0ꜫ�Z���h��$nF�1�@؂���n��(n���1�m�NH*n�$����I�(�/�` �^ j��(T`ZUu�;�+$�a-%1@@T�A�qT��O�����
�j�^)����8)B��I������K�������}o���Rʔqz~��ح�}�b�u$�VP�h�UI� <����!L�N&��,��!c��鋐"���TVA:�
�ʟ��v��sM��T�U�TM�6����T]N�[u;�Fms�.{�[��`n~sw �"I�����{=x1���K�5��u�[���E.��2���_]��<!���e��b���~(o7 pn7�!U��Ȃ04�4c<y!�$��"��\!�1�G�tmCm1��O��晪Q�f��9�bm���{ݬǹ���%餧Vhk�E}���j��{�����o��K��/�it#�G�ٍ������Ϣ��'�ߜ�/'=�&]ww��JW~���]�L�'#���	r��Ƒ���b�ħ��@���k��R`�"�u���\u7�)qh�G]�%�*Yi�������>tݯY[�(�����b{-v���MY��X��1G��2�aL�q�)�<`xƨWF�q 2�0���B����4M�Υ'V����I�R$iB�4�H�H
e�I�몚�_E��U�,ݪ��h�<Q�Uk�D�j�y���S=O����nnr:�L��r:-ť�D]��J&Sefn�v�p���Vp�xCF��%y	^����X�?.������/kT��'�����$ی_<�n4,P�fW��t�s���I��56V��P�i��S��N_5�͟�� ���x=�L)?*@�%��?��{=,��!xk�g�A���u��d\�{���4�^�S\�ޓ���fdz�'�g��N%��⃢>Ct���dx����dfrrf�)��ʄ#H��Uf'�N���`Wө�z��j�����-��b��/1�}������q���vL��}�hk�Zl���u	���t��+~do,Wݺϸ|��>�(ڞ�vU�l���hx�0�Q]�S�}\蠄(3 �O'������f�p�����㇆������JO�w"�@��TO��JM=c���3V���i}k4��:��v���b+ƂQm��
�-k=h�ݏ���}�c��|\$M'��w�b�b��Ϧ�&#��Mm��2ns��njw�b�u�G8���8�d�K��S�|܂GrH E��LЌ����Uce��2̙7J�:�5��6R��گo�-������[�F׭"?��
�%W8� ��m�4�
@J'����w�j��1��A�&�s������['S���*�v�6ȡs�#�9�5���5=W����D�����~��[��K��h��֓8~�~�����m����_{R��r�,b�c�r�TT<���b)��JhS��������Iغ�VHV�li z��%���dА� ]��{�'P��d-�S�sV�5E�3Ek4ڪSw77;݊cѨs���Rn��R����T�L"2���R�=�Eы�I�����g�%M�b�O�Ka�uq��a�1J1��C��<R'�4ЀNA�anu_����]Y{ݫ��[ѥ���[,E��o�.b�G��X����6<�oO�B�}������t��X��P�?0�y�������$-��>3��	k�{����?=�� {��n�:Saz��Ι%�a/c�?�~l����mJf�Q��<val0��
(M��� �0���C,�w;�z��z�ZV۫N��ir���R�Z�o�;QQv��X���u��}���^/���c�CCc-��D�����$8Alp �#�rɔN�
f2gT* N��d�E,A=K�v76�\S�z��N�ڬ��S�#i:�V�d���˥k��`^`^�[����Л�<k��mx*@�$�G���8���[S�*����1n(��\�R���GGmU`?~����I�Arw�Կ�2���r�7z&#Bv�^L�j�3$�;='"A>TjHs�PvԘ5  !��C�{q��1kv�@ =x4HKZ4ڪSw76,��׿�b1���.�Б�� ���D� ��D|EǮd�h�߿$��x}��#��E]>��/O�c���ʭ:����,G@2AMaN�{��$$`�y�d�-�322UK�1}z�{���K���*9~�q<l��Ro����#��r�]�4��F�~��#�$����|�C��-O�A�	����#(S�c�z(��u�M^z���a�ň��r`��"����
(7�h�S����<�rot��+��2��b/�N�̌{,,��ү~c'�&�o�1U=�r�U�(�O׊����>k�Y��%xB|�o>��.`1=:�� ����gn1������$���#-���nl4����TUu�8�F�=+��<SV�j�T`�,0�9�鷭u";�2KY�R�-&�^�{;����q��,\?��T���a�~��- `�������+K/��W�����D��0(D�"�A
���PI>"��ӂ��O]�.)R?�? ���g�[�5Zn������{���]��׊�-������b��+��a
��߄��Mx[��(H| �}�	}9��'�d�����D��7�pR��N�v:�UU��se�\��`*Ж���ϾK�y��'{q���q�2BD�	f�T@B�*��ש��-�2�z���Yަ�*��D�
�Ý�
 a�g���
��r��Q����W�F���=��E���� ��s����݅cCh��}�;u���Fcl)֟����L���H/����d���=:}���A���n.�y�gQ�	8��1.A���)�?���WmK1
�F6}2�.�T ������Y���k�{���l�ٱ�1.��+o1~p��n���Ec�n��E�Z/`u}	A��e��2N�+;����s�A�,0���(�Y���e(����=$,>	*�\��5��l}/b�r�c���0H}����T��jx������;+H�u���'�d]m�J��Hx�FQ���43��52��(�/�` �P ���V`����_� T~������ؽ���K�o ��������U`܁�c�,��j�bs�"0�$BJ5���O�X�kķ�oBȖ2�����^Z���?�ű9����~��x�����30�?<�S��\�@�5��#M����ŭ����Ͻ��7W����`.�;���\���F�|F �R͵t@$�����B�p��FJ|�� ������W�K�3�j��p/.�|��I�/2FFvٿ#��p�)T�V�� ���fQ��mKۼZןˮ���b`,�,�ȣX��#�cq�%�gǍb��x���~V�1i���~b<I/̢fja�MUԦ�����f������z�R�rI �Z�vd7��s�R)᰹���\��t��cޯsc�R-�b+�9���Cɥ��L /4L�an趡#�g���9�"�350�쎥+͑�ژgL'��vT�TEo6;j.�SS�M��65�4o~�w_�2�w���Hm퇜ǳ�
��2[�X[6q�>��m��g"@�?K ̖B0eK4'wQE�yB�! х@�@��V)����G�L�j�T@p�Hp 	����㬶�w����ba��S�l8��/��ۦ+wM ��z��-�M<Sg���$��E��y���6+� Az[ Q&���<~�mCq��7W}����I��[�FX�M�j3m8���j��$�" �����U�M��a;�0~|MK�~c�.H������ �D�=�`G���Lo�����^�*���-��L~��z/NA�!n�ԏ�U���(lؖo�cLb��Y}=� ;�n�^#�n��p�xGq��pȶe�g�_��r��Xs��&&�5�K �ۅ �~�D ��ɓ)����L��b�u����R��е��0|Q(�C�=[e<.��C���-�}���Ŝ�����=�nb(�%�)���甔x�(唒x�b�ԝ���vo�d�7���z	#���f�5�L���ђ�C|������5����ל��2eG��V��)>Vl�f��*��&�d��]�	�wڅ ߉'O]��U�耚�5S+sCI���Eo�S�p�G�o�(Ј��f��g�O�O�j��u��/c)D��KE�DT�W"_"�ԙ��"�(���A�)"��J����~4�C�놶�h+�Պ�Z����gD�#�Y�6�fL'��n|2.vY-��V2R�2��mf��8� 9��"ghnpx!L�
)G^�H�#��{�D���jN	�vۢ���o��u{*�g�����y�a��nl <�QP����E\0p�1o4to(��:��$S�H������&�2f��Ę(�{Y�!�e���1�6�	Y+2ɖYg�/��w:Q��{�	~ x%
 c�z(�(�,������cl��Z:
ca�l`�>���s��$�3���p��-rG�J�Ty���1�%� 33���q4u9�4S��͆�|���]1�c.^�˫<��=�H��D�7�g��ٶU��� !㕞�<�D@����P�N��0���`�D�)�3��V�&O}%}9���pCO���mhE���&�Դ`��6 V�AW;	� '���hZ��+��Qws�[�f�f��4,O���G�Z	��03g'�NZ�^d�r�r�/��Tmѩ*M���cU'Emh�����d�e�,6_	�Cھo_$>yd�n������)H�H�G��mqd2Z��i��Wӂ-�D���2a�L 2trp��,]���r�R��� �t�xP^t,a�Z���QWҖ_��HG|�gj#���4�������3փ�#�~�9�ȇ>�JeoO�D�c��)���-K�h{�Zo�g�FK�\eD
��gj¬���)��[W��@	�̘�6���9����g.zu�sr����v�@)����3���
in>���'5� �S;��zS�c�k�)p_S	�4	F9�rzSzUxR3��SG9ʒ�o��Y�� Io(ɓ��Sg��	�ި�$�2���H$3�&@B���`�-*RdDh"IAJ�RM���r�+vZ����`�[���Y�7��,s�RC�6�Ë�R?+$��'�6F�����ˎ�}�d�wO��L�OS�&��$W�	�PA��Α��B�-�s*�z�.oq�˼�?/=+����vi'&��ihҐ63|�~=q>W�N�^����ԉ9e9v��/��#��e!E[^�z\�q���7>ǜ�p_+u�l���T�]�c ��q>�2����CG�n1L�P8>�=fDH�R�.ү@���"/�,��q���J��"���r�l��l^���R���z@h<�z�D~N��2���n����+Цu4�R�c�"��t�BcK��k\?��<����	�x��f���yǇ�����,!f��c?kI�����t��8(��o\	7��,'���u.�s�EFm1�N�b�R�^ԁ���	sF�^l�%�U�I8�dY��LkoW�Zd��]��=�3��=��gm���R#g���U���@U���J�P�
(�/�`R	�2 �^H��Q:��]vS�vmَ��1L�I0�M]d���22e�-�h+��ĳFaI:�m\`kLހу��ٲ��X"�L),)?�.5�Ƶ���ӧ��̿��j����"�)>7!�P�5R�3 ��h)-ڎ&�J@��pM�!��S����!��S�qlq�/7��S��yv�i4?o��E�pq�A �J4��{M[�(�&<x�0��5���KEW�I�Γ[���p��MmS{�|�R�ռ��3�(;���V�M��#�=��T	'We�C��P�{g�����5����OY���q�G�޿�ul�����is���;��Q��YU'ᥖ"��g��c8�Rg��?�b%�(� ߯s���r����L��t>T�DDD_Gߺ�B,�i�����v0ּ��׽v(]���}�Y|�A:ɻ��A��qe�����E>f�n'��{��\�_��^0���mdd����Vb�g��v1�����j*�j�YYt��^���J���ݿ,��2z���k�`��GV�V��& UN�}��z����8���I۶EC/'^�Zdw��v��_�uS۶�!M.�C{_�"��^����
�0�l�j� c*��J��
���X�1S6;��G��gr����-�^�ޱ���4�v�6ɑ�*�-���PĮ `�1T*p T�(1-WbR��w�=���y��'ϽE�%/�x�s�L��{���lt~	�ӆSl C�
ד}2�W��=v;��0
 �E���[��4�Ny�5��=d+'�]�@�W�s�Ӛ��|d���������͝��k��DN͠?����-瞹�߮y8w�S���VH3�L&II��S�.�;��4u&��.|.�v!��dW�_R�����w�V�nm����d:��\%mۮ��\=�����VF����@�d#]�a  ����, � �>k��mV;�(-��KJ5J��C&	�4g��5	i���2@�'R��|K��!V���I�����QE�_f�*���CX0��X�0����_�˻t��'�-s���jC@,�
��a@����;d˙�l�@Ai�7L�ɩ��i�ꉢ��P=ע�rv�*N�����W��sɿ��dw̔51Ǌ�lƝ�r������.��ο�+�^��K�%-=6�f�
�-@OH�'��"@�ܸ����h�$ĕ>�GDs]��XQZ�5�=f�n@(P�C��gr��;������6��Gd�t�kOs+�9��}YpN�0?h'�  �hQDSAC��S���
�$�z��"^����(Ŕ2�rDFD�I�`�����5Ť!��FJ
�,��iI؛�|&�ȟ]����z��{��+s4��ߓ"�s�P�?T���87*�l�0�A�Mj��;�pY���oOj��xG"wˤ�A[Ix���c �-�C �t���,����w�m�����_��e�3���(�oR�b���h�r��>���	(�2gz:N�v-�V�b-��Iː�x\�®�n������]�W0L����j�Mg�+�>5Ё�P�(�1�Q��E���G��H��a�$�Hm����!����
� �V����l?n�Na����m9��y�SĩRSCC             [remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://dfwmisxih76sv"
path="res://.godot/imported/ProtestStrike-Regular.ttf-5c8b1d7fe067996c5f080f3d85bf516d.fontdata"
               extends GridContainer
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
		

         extends Button

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
              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://win_button.gd ��������      local://PackedScene_auwmr          PackedScene          	         names "      
   WinButton    size_flags_horizontal    size_flags_vertical    text    script    Button    _on_button_up 
   button_up    	   variants                   asdf                 node_count             nodes        ��������       ����                                       conn_count             conns                                       node_paths              editable_instances              version             RSRC          [remap]

path="res://.godot/exported/133200997/export-fdaed7e491d039e2a0cca5d73581150a-game_menu.scn"
          [remap]

path="res://.godot/exported/133200997/export-cf8532bc06c1243e731119a1dc90fa78-global.scn"
             [remap]

path="res://.godot/exported/133200997/export-da3c52c1d1e8632f6d27195cf30ab181-label.scn"
              [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-de75b109a0ef34bfbb9569df46f58a57-new_theme.res"
          [remap]

path="res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn"
             [remap]

path="res://.godot/exported/133200997/export-37c47c2d084a3a67437f51e759903a9d-PlayerRow.scn"
          [remap]

path="res://.godot/exported/133200997/export-3176f3f4ab7fd48ab19332ecb0668741-win_button.scn"
         list=Array[Dictionary]([{
"base": &"Node",
"class": &"Player",
"icon": "",
"language": &"GDScript",
"path": "res://player.gd"
}])
              <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
          
   *d!�{�'   res://game_menu.tscn��W�4j@   res://global.tscn�$sd� AT   res://icon.svg_�Ɲ�ESs   res://label.tscn=A��̝c,   res://main.tscnny��k	   res://new_theme.tres�09S �w   res://player.tscnƯ���R*   res://PlayerRow.tscn�?�@��h   res://ProtestStrike-Regular.ttf�8�ء�ZD   res://win_button.tscn     ECFG      application/config/name         Online Poker   application/run/main_scene         res://label.tscn   application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg     autoload/Global         *res://global.tscn  "   display/window/size/viewport_width      �  #   display/window/size/viewport_height      8     display/window/size/mode            display/window/stretch/mode         canvas_items   input/enter�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility              