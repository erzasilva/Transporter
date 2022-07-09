extends Control





func _on_QuitButton_pressed():
	get_parent().is_paused = false
	get_tree().paused = false
	#change scene



func _on_PlayButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://UI/CarSelection.tscn")
