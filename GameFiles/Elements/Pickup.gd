extends Node2D

#main Variables
export var item_id: int
var health: int
export var dispatched = false

func _ready():
	set_details()
func set_details():
	health = Tables.item_list[item_id]["health"]
	
func _on_Area2D_body_entered(body):
	if not dispatched:
		var result = body.inv_add(item_id, health)
		if result:
			dispatched = true
