extends CanvasLayer

#onready vars
onready var TouchJoyStick = $OuterRing
onready var TouchIndicator = $InnerRing
onready var HBContainer = $HB_BG/HealthBarContainer
onready var ShieldStatus = $HB_BG/ShieldStatus


#prefabs
var HBListing = preload("res://UI/ItemHealthHUD.tscn")
var Player

#signals
signal Move_detected

#helpers
var move_vector = Vector2.ZERO
var joystick_active = false
var TouchCenter
var IndicatorOffset = Vector2(36, 36)
var Shield_on = "Shields: [color=green]ON[/color]"
var Shield_off = "Shields: [color=red]OFF[/color]"

func _ready():
	Player = get_tree().get_root().find_node("Player", true,false)
	TouchCenter = TouchJoyStick.position + Vector2(80, 80)
	TouchIndicator.rect_position = TouchCenter - IndicatorOffset
	change_sheild(true)
	
	
func _input(event):
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
		if TouchJoyStick.is_pressed():
			move_vector = (event.position - TouchCenter).normalized()
			emit_signal("Move_detected", move_vector)
			var TouchDistance = TouchCenter.distance_to(event.position)
			TouchIndicator.rect_position = TouchCenter + (move_vector * clamp(TouchDistance, 0, 80)) - IndicatorOffset
			
	if event is InputEventScreenTouch:
		if event.is_pressed() == false:
			move_vector = Vector2.ZERO
			emit_signal("Move_detected", move_vector)
			TouchIndicator.rect_position = TouchCenter - IndicatorOffset

func inv_add(id, cur_health):
	var temp = HBListing.instance()
	temp.set_details(id, Tables.item_list[id]["name"], Tables.item_list[id]["health"], cur_health)
	HBContainer.add_child(temp)
		
func update_HB():
	for child in HBContainer.get_children():
		child.queue_free()
	for item in Player.inventory:
		inv_add(item["id"], item["health"])

func update_slots(pickup_list):
	var children = $Consume_BG/InvContainer.get_children()
	var counter = 0
	for child in children:
		if pickup_list[counter] == -1:
			child.deassign_slot()
		else:
			child.assign_slot(pickup_list[counter])
		counter+=1

func change_sheild(val):
	if val:
		ShieldStatus.bbcode_text = Shield_off
	else:
		ShieldStatus.bbcode_text = Shield_on
