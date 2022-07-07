extends Control


var current = 0

onready var icon = $BG/BGMargin/ElementContainer/SelectorMargin/CarSprite
onready var infoBox = $BG/BGMargin/ElementContainer/SelectorMargin/InfoContainer/InfoBox
onready var locked_icon = $BG/BGMargin/ElementContainer/SelectorMargin/Locked
func _ready():
	update_screen()

func update_screen():
	icon.texture = load(Tables.cars_list[current]["icon"])
	infoBox.text = Tables.cars_list[current]["info"]
	locked_icon.visible = !PlayerStats.player_garage[current]

func _on_Left_pressed():
	current -= 1
	if current < 0:
		current = 4
	update_screen()


func _on_Right_pressed():
	current += 1
	if current > 4:
		current = 0
	update_screen()
