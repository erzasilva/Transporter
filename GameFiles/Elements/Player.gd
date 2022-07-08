extends KinematicBody2D


#onready vars
onready var HUD = $HUD

#stats
var speed = 200
var inventory_open_slots = 6
var speed_modifier = 0
var can_take_damage = true



#helpers
var move_dir = Vector2.ZERO
var last_dir = Vector2.ZERO



#main Variables
var inventory = []
var pickups = [-1, -1, -1]

# Called when the node enters the scene tree for the first time.
func _ready():
	speed_modifier = Tables.cars_list[PlayerStats.current_player_car]["speed"]
	inventory_open_slots = Tables.cars_list[PlayerStats.current_player_car]["slots"]
	$Body.texture = load(Tables.cars_list[PlayerStats.current_player_car]["icon"])

func _physics_process(_delta):
# warning-ignore:return_value_discarded
	move_and_slide((move_dir * (speed * speed_modifier)))
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
	if can_take_damage:	
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
			HUD.update_slots(pickups)
			return true
		counter+= 1
	return false	

#modifiers
func change_speed_modifier(new_val):
	speed_modifier += new_val


func use_consume(health_c, damage_c, speed_c, slot_location):
	add_health(health_c)
	change_speed_modifier(speed_c)
	if speed_c > 0:
		$SpeedTimer.start(7)
	pickups[slot_location] = -1
	can_take_damage = damage_c
	HUD.change_sheild(damage_c)
	if not damage_c:
		$ShieldTimer.start(5)
	HUD.update_slots(pickups)


func _on_SheildTimer_timeout():
	$ShieldTimer.stop()
	can_take_damage = true
	HUD.change_sheild(true)


func _on_SpeedTimer_timeout():
	$SpeedTimer.stop()
	speed_modifier = Tables.cars_list[PlayerStats.current_player_car]["speed"]
