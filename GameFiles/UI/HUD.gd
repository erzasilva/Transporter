extends CanvasLayer

#onready vars
onready var TouchJoyStick = $OuterRing
onready var TouchIndicator = $InnerRing

#signals
signal Move_detected

#helpers
var move_vector = Vector2.ZERO
var joystick_active = false
var TouchCenter

func _ready():
	TouchCenter = TouchJoyStick.position + Vector2(80, 80)
	
	
func _input(event):
	if event is InputEventScreenDrag or event is InputEventScreenTouch:
		if TouchJoyStick.is_pressed():
			move_vector = (event.position - TouchCenter).normalized()
			emit_signal("Move_detected", move_vector)
			
	if event is InputEventScreenTouch:
		if event.is_pressed() == false:
			move_vector = Vector2.ZERO
			emit_signal("Move_detected", move_vector)
