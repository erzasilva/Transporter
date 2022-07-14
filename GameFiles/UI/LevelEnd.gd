extends PopupPanel

var complete = false
var stars = 0

onready var MedalContainer = $MarginContainer/VBoxContainer/ButtonContainer/VBoxContainer/MedalContainer



func update_screen(score):
	for child in MedalContainer.get_children():
		child.visible = false
	if score > 0.8:
		stars = 3
		PlayerStats.player_money += 100 + (80 * PlayerStats.current_running_class)
	elif score > 0.6:
		stars = 2
		PlayerStats.player_money += 70 + (40 * PlayerStats.current_running_class)
	elif score > 0.4:
		stars = 1
		PlayerStats.player_money += 50 + (10 * PlayerStats.current_running_class)
	for i in range(stars):
		MedalContainer.get_child(i).visible = true
	if stars == 0:
		$MarginContainer/VBoxContainer/ButtonContainer/VBoxContainer/NextButton/Label.text = "Retry"
	else:
		$MarginContainer/VBoxContainer/ButtonContainer/VBoxContainer/NextButton/Label.text = "Next"
		complete = true
	get_tree().call_group("World", "update_table", stars)
	
	



func _on_NextButton_pressed():
	if complete:
		get_tree().paused = false
		if PlayerStats.current_running_level == 9:
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://UI/MapSelectionScreen.tscn")
		else:
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://UI/LevelSelection.tscn")
		
	else:
		get_tree().paused = false
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
