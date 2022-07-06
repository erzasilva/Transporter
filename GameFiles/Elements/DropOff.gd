extends Node2D

#main Variables
export var item_id :int

func _ready():
	$Icon.texture = load(Tables.item_list[item_id]["icon"])

func _on_Area2D_body_entered(body):
	var result = body.inv_delivered(item_id)
	if result:
			queue_free()
