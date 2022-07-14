extends Node2D

export var pickup_id = -1

func set_icon():
	$Sprite.texture = load(Tables.consume_list[pickup_id]["icon"])

func _on_Area2D_body_entered(body):
	var result = body.pick_consume(pickup_id)
	if result:
		queue_free()
