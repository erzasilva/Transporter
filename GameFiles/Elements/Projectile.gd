extends KinematicBody2D

export (Vector2) var direction
export (float) var Speed
export (float) var life

func _ready():
	$LifeTimer.start(life)

func _physics_process(delta):
	move_and_collide(direction * Speed)
#
func _on_LifeTimer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.has_method("inv_hit"):
		body.inv_hit(20)
		queue_free()
