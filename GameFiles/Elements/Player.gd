extends KinematicBody2D

#helpers
var speed = 10000
var move_dir = Vector2.ZERO
var inventory_open_slots


#main Variables
var inventory = [{"id": -1, "heath": -1}, {"id": -1, "heath": -1}, {"id": -1, "heath": -1}, {"id": -1, "heath": -1}, {"id": -1, "heath": -1}]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move_and_slide((move_dir * speed * delta))
	
	
func _on_HUD_Move_detected(move_vector):
	move_dir = move_vector
	rotation = move_vector.angle()


#inventory functions
func inv_add(pos, id, health):
	inventory[pos]["id"] = id
	inventory[pos]["health"] = health

func inv_remove(pos):
	inventory[pos]["id"] = -1
	inventory[pos]["health"] = -1

func inv_hit(damage):
	var counter = 0
	for item in inventory:
		if item["healrh"] > damage:
			item["health"] -= damage
		else:
			inv_remove(counter)
		counter += 1
		if counter >= inventory_open_slots:
			break
