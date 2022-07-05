extends KinematicBody2D

#helpers
var speed = 200
var move_dir = Vector2.ZERO
var last_dir = Vector2.ZERO
var inventory_open_slots = 2



#main Variables
var inventory = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	move_and_slide((move_dir * speed))
	if Input.is_action_just_pressed("tester"):
		inv_hit(50)
	
	
func _on_HUD_Move_detected(move_vector):
	if move_vector == Vector2.ZERO:
		last_dir = move_dir
		move_dir = move_vector
		rotation = last_dir.angle()
	else:
		move_dir = move_vector
		rotation = move_vector.angle()


#inventory functions
func inv_add(id, health):
	if inventory.size() < inventory_open_slots:
		var temp = {}
		temp["id"] = id
		temp["health"] = health
		inventory.append(temp)
		get_tree().call_group("HUD", "inv_add", id)
		return true
	return false
func inv_remove(id):
	var counter = 0
	var result = false
	for item in inventory:
		if inventory[counter]["id"] == id:
			result = true
			break
		counter += 1
	if result:
		inventory.remove(counter)
		get_tree().call_group("HUD", "inv_remove", counter)
	return result
	
func inv_hit(damage):
	var counter = 0
	for item in inventory:
		if item["health"] > damage:
			item["health"] -= damage
		else:
			inv_remove(inventory[counter]["id"])
		counter += 1
		
	get_tree().call_group("HUD","inv_hit", damage)
