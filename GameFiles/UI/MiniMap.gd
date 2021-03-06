extends MarginContainer

export (NodePath) var player
var zoom = 1.25

onready var BG = $MarginContainer/BG
onready var player_m = $MarginContainer/BG/PlayerMarker
onready var pickup_m = $MarginContainer/BG/PickupMarker
onready var dropoff_m = $MarginContainer/BG/DropMarker
onready var npc_m = $MarginContainer/BG/NPCMarker

onready var icons = {"pickup": pickup_m, "dropoff": dropoff_m, "npc": npc_m}

var gridscale
var markers = {}


func _ready():
	player_m.position = BG.rect_size / 2
	gridscale = BG.rect_size / (get_viewport_rect().size * zoom)
#	
#
func obj_deleted(item):
	markers[item].queue_free()
	markers.erase(item)
	
func _process(_delta):
	if !player:
		return
	player_m.rotation = get_node(player).rotation

func add_marker(key):
	var new_marker = icons[key.minimap_icon].duplicate()
	BG.add_child(new_marker)
	new_marker.show()
	markers[key] = new_marker
		

func update_marker(item):
	var obj_pos = (item.position - get_node(player).position) * gridscale + BG.rect_size / 2
	var direction_vec = (obj_pos - (BG.rect_size  / 2)).normalized()
	var dist = obj_pos.distance_to(BG.rect_size / 2)
	if dist >= BG.rect_size.x / 2:
		markers[item].scale = Vector2(0.15, 0.15)
	else:
		markers[item].scale = Vector2(0.2, 0.2)
	markers[item].position = (BG.rect_size / 2) + (direction_vec * clamp(dist, 0 , BG.rect_size.x / 2))
