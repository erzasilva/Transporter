extends Control


export var level_id = 0

func setup_Node():
	$MarginContainer/VBoxContainer/ColorRect/LevelNum.text = str(level_id + 1)
	if Tables.levelData[str(PlayerStats.current_running_class)][str(level_id)]["s"] > 0:
		for i in range(0, Tables.levelData[str(PlayerStats.current_running_class)][str(level_id)]["s"]):
			$MarginContainer/VBoxContainer/MedalContainer.get_child(i).visible = true


func _on_ColorRect_pressed():
	PlayerStats.current_running_level = level_id
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://UI/CarSelection.tscn")
	
