extends Node2D

#main variables
var level_class = "Test"
var level_id = 0
var level_data = {}


onready var WaypointsP = $PickupWaypoints
onready var DropoffP = $DropoffWaypoints
onready var ConsumeP = $ConsumeWaypoints
onready var PnDLayer = $PnDs
onready var ConsumeLayer = $Consumes

var pickup_f = preload("res://Elements/Pickup.tscn")
var dropoff_f = preload("res://Elements/DropOff.tscn")
var consume_f = preload("res://Elements/Consumes.tscn")

func _ready():
	level_class = PlayerStats.current_running_class
	level_id = PlayerStats.current_running_level
	level_data = Tables.levelData[level_class][str(level_id)]
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
			PnDLayer.add_child(temp)
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
			PnDLayer.add_child(temp)
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
			temp.position = waypoint.position
			ConsumeLayer.add_child(temp)
			cnt += 1
	
