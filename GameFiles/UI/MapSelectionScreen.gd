extends Control

onready var MapNode = load("res://UI/MapNode.tscn")

func _ready():
	button_toggle()
	setup_screen()
	
func setup_screen():
	for i in range(1, Tables.levelData.size()):
		var temp = MapNode.instance()
		temp.MapIcon = Tables.levelData[str(i)]["icon"]
		temp.MapName = Tables.levelData[str(i)]["name"]
		temp.Map_ID = i
		$ScrollContainer/HBoxContainer.add_child(temp)


func _on_Left_pressed():
	$ScrollContainer.scroll_horizontal = clamp($ScrollContainer.scroll_horizontal - 254, 0, $ScrollContainer/HBoxContainer.get_child_count() * 254 + 1)
	button_toggle()

func _on_Right_pressed():
	$ScrollContainer.scroll_horizontal = clamp($ScrollContainer.scroll_horizontal + 254, 0, $ScrollContainer/HBoxContainer.get_child_count() * 254 + 1)
	button_toggle()

func button_toggle():
	if $ScrollContainer.scroll_horizontal == 0:
		$Left.visible = false
	else:
		$Left.visible = true
	
	
	if $ScrollContainer.scroll_horizontal == ($ScrollContainer/HBoxContainer.get_child_count() - 1) * 254:
		$Right.visible = false
	else:
		$Right.visible = true


func _on_GoBack_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://UI/MainMenu.tscn")
