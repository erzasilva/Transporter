extends Control

export var Level_Class = 0
var level_data

func _ready():
	Level_Class = PlayerStats.current_running_class
	level_data = Tables.levelData[str(Level_Class)]
	var cnt = 0
	for child in $BG/VBoxContainer/MarginContainer/GridContainer.get_children():
		child.level_id = cnt
		child.setup_Node()
		cnt+=1

