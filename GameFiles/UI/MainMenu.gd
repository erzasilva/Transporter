extends Control





func _on_QuitButton_pressed():
	get_tree().quit(0)



func _on_PlayButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://UI/MapSelectionScreen.tscn")
