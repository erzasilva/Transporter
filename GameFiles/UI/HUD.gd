extends CanvasLayer

#onready vars
onready var TouchJoyStick = $OuterRing

#signals
signal Move_detected

#helpers
var move_vector = Vector2.ZERO
var joystick_active = false
func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if TouchJoyStick.is_pressed():
			var temp = event.position - (TouchJoyStick.position + Vector2(80, 80))
			move_vector = temp.normalized()
			joystick_active = true
			emit_signal("Move_detected", move_vector)
	
	if event is InputEventScreenTouch:
		if event.pressed == false:
			joystick_active = false
			move_vector = Vector2.ZERO
			emit_signal("Move_detected", move_vector)
	
