extends Node2D

export var pickup_id = 0


func _on_Area2D_body_entered(body):
	var result = body.pick_consume(pickup_id)
	if result:
		queue_free()
