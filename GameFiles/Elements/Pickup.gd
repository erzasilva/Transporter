extends Node2D

#main Variables
export var item_id: int
var health: int

var minimap_icon = "pickup"

func _ready():
	set_details()
	
func _process(_delta):
	get_tree().call_group("minimap", "update_marker", self)

func set_details():
	health = Tables.item_list[item_id]["health"]
	$Icon.texture = load(Tables.item_list[item_id]["icon"])
	
func _on_Area2D_body_entered(body):	
	var result = body.inv_add(item_id, health)
	if result:
		get_tree().call_group("minimap", "obj_deleted", self)
		queue_free()
