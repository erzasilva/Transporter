extends PopupPanel




func _on_ResumeButton_pressed():
	get_parent().is_paused = false
	get_tree().paused = false
	hide()


func _on_QuitButton_pressed():
	get_parent().is_paused = false
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://UI/MainMenu.tscn")

