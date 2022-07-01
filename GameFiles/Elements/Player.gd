extends KinematicBody2D

#helpers
var speed = 10000
var move_dir = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move_and_slide((move_dir * speed * delta))
	
	
func _on_HUD_Move_detected(move_vector):
	move_dir = move_vector
	rotation = move_vector.angle()
