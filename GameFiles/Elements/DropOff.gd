extends Node2D

#main Variables
export var item_id = 0
export var delivered = false

func _on_Area2D_body_entered(body):
	if not delivered:
		var result = body.inv_remove(item_id)
		if result:
			delivered = true
