extends Control


var MapIcon
var MapName
var Map_ID

func _ready():
	$MarginContainer/VBoxContainer/MapIcon.texture = load(MapIcon)
	$MarginContainer/VBoxContainer/MapIcon/MapName.text = MapName
	if Map_ID > PlayerStats.last_completed_class:
		$LockScreen.visible = true
	


func _on_GoButton_pressed():
	PlayerStats.current_running_class = Map_ID
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://UI/LevelSelection.tscn")
