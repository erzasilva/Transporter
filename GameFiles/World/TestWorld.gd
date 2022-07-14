extends Node2D

#main variables
export var level_class = 0
var level_id = 0
var level_data = {}
var total_exp: float = 0


onready var WaypointsP = $PickupWaypoints
onready var DropoffP = $DropoffWaypoints
onready var ConsumeP = $ConsumeWaypoints
onready var NPCP = $NPCWaypoints
onready var PickupLayer = $Pickups
onready var DropoffLayer = $Dropoffs
onready var ConsumeLayer = $Consumes
onready var NPCLayer = $NPCs
onready var Player = $Player

var pickup_f = preload("res://Elements/Pickup.tscn")
var dropoff_f = preload("res://Elements/DropOff.tscn")
var consume_f = preload("res://Elements/Consumes.tscn")
var npc_f = preload("res://Elements/NPC_Turret.tscn")

func _ready():
	level_class = PlayerStats.current_running_class
	level_id = PlayerStats.current_running_level
	level_data = Tables.levelData[str(level_class)][str(level_id)]
	setup_level()
	
func setup_level():
	var cnt = 0
	for i in level_data["p"]:
		if i == -1:
			cnt+= 1
			continue
		else:
			var waypoint = WaypointsP.get_child(cnt)
			var temp = pickup_f.instance()
			temp.item_id = i
			temp.position = waypoint.position
			PickupLayer.add_child(temp)
			total_exp += Tables.item_list[i]["exp"]
			cnt += 1
	cnt = 0
	for i in level_data["d"]:
		if i == -1:
			cnt+= 1
			continue
		else:
			var waypoint = DropoffP.get_child(cnt)
			var temp = dropoff_f.instance()
			temp.item_id = i
			temp.position = waypoint.position
			DropoffLayer.add_child(temp)
			cnt += 1
	cnt = 0
	for i in level_data["c"]:
		if i == -1:
			cnt+= 1
			continue
		else:
			var waypoint = ConsumeP.get_child(cnt)
			var temp = consume_f.instance()
			temp.pickup_id = i
			temp.set_icon()
			temp.position = waypoint.position
			ConsumeLayer.add_child(temp)
			cnt += 1
	cnt = 0
	for i in level_data["n"]:
		if i == -1:
			cnt+= 1
			continue
		else:
			var waypoint = NPCP.get_child(cnt)
			var temp = npc_f.instance()
			temp.position = waypoint.position
			NPCLayer.add_child(temp)
			cnt+= 1
			
func check_end_state():
	if PickupLayer.get_child_count() == 0 and Player.inventory.size() == 0:
		get_tree().paused = true
		get_tree().call_group("HUD", "end_screen", (Player.exp_count / total_exp))

func update_table(stars):
	Tables.levelData[str(level_class)][str(level_id)]["s"] = stars
	if stars > 0:
		var currentcode = (level_class * 100) + level_id
		var lastCode = (PlayerStats.last_completed_class * 100) + (PlayerStats.last_completed_level)
		if currentcode > lastCode:
			PlayerStats.last_completed_class = level_class
			PlayerStats.last_completed_level = level_id
	PlayerStats.save_game()
	
