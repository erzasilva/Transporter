extends Node2D

#main Variables
export var item_id :int

var minimap_icon = "dropoff"

func _ready():
	$Icon.texture = load(Tables.item_list[item_id]["icon"])
	get_tree().call_group("minimap", "add_marker", self)

func _process(_delta):
	get_tree().call_group("minimap", "update_marker", self)

func _on_Area2D_body_entered(body):
	var result = body.inv_delivered(item_id)
	if result:
			get_tree().call_group("minimap", "obj_deleted", self)
			queue_free()
