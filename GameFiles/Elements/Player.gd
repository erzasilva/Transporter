extends KinematicBody2D


#onready vars
onready var HUD = $HUD

#stats
var speed = 200
var inventory_open_slots = 2
var speed_modifier = 0



#helpers
var move_dir = Vector2.ZERO
var last_dir = Vector2.ZERO



#main Variables
var inventory = []
var pickups = [-1, -1, -1]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	move_and_slide((move_dir * (speed + speed_modifier)))
	if Input.is_action_just_pressed("tester"):
		inv_hit(81)
	
	
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
		temp["max_health"] = health
		inventory.append(temp)
		HUD.update_HB()
		return true
	return false

	
func inv_delivered(id):
	var counter = 0
	var result = false
	for item in inventory:
		if inventory[counter]["id"] == id:
			result = true
			break
		counter += 1
	if result:
		inventory.remove(counter)
		HUD.update_HB()
	return result
	
func inv_hit(damage):
	var counter = 0
	while counter < inventory.size():
		if inventory[counter]["health"] > damage:
			inventory[counter]["health"] -= damage
			counter+= 1
		else:
			inventory.remove(counter)
			
			
	HUD.update_HB()

func add_health(inc_health):
	for item in inventory:
		item["health"] += inc_health
		if item["health"] >= item["max_health"]:
			item["health"] = item["max_health"]
	HUD.update_HB()

func pick_consume(pickup_id):
	var counter = 0
	for slot in pickups:
		if slot == -1:
			pickups[counter] = pickup_id
			print(pickups)
			HUD.update_slots(pickups)
			return true
		counter+= 1
	return false	

#modifiers
func change_speed_modifier(new_val):
	speed_modifier = new_val


func use_consume(health_c, _time_c, speed_c, slot_location):
	add_health(health_c)
	change_speed_modifier(speed_c)
	pickups[slot_location] = -1
	HUD.update_slots(pickups)
