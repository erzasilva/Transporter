extends Control


var current = 0

onready var icon = $BG/BGMargin/ElementContainer/SelectorMargin/CarSprite
onready var infoBox = $BG/BGMargin/ElementContainer/SelectorMargin/InfoContainer/InfoBox
onready var locked_icon = $BG/BGMargin/ElementContainer/SelectorMargin/Locked
onready var BuyButton = $BG/BGMargin/ElementContainer/SelectorMargin/InfoContainer/BuyContainer/BuyButton
onready var Confirm_popup = $BG/PurchaseConfirmation
onready var GoButton = $BG/BGMargin/ElementContainer/OkContainer/OkButton
onready var PlayerMoney = $BG/BGMargin/ElementContainer/PlayerMoney


func _ready():
	update_screen()

func update_screen():
	icon.texture = load(Tables.cars_list[current]["icon"])
	infoBox.text = "Name: " + Tables.cars_list[current]["name"] + "\nDelivery Slots: " + str(Tables.cars_list[current]["slots"]) + "\nSpeed: " + str(Tables.cars_list[current]["speed"] * 100) + "\nCost: "  + str(Tables.cars_list[current]["cost"])
	locked_icon.visible = !PlayerStats.player_garage[current]
	BuyButton.disabled = PlayerStats.player_garage[current]
	BuyButton.visible = !PlayerStats.player_garage[current]
	if BuyButton.visible:
		if PlayerStats.player_money < Tables.cars_list[current]["cost"]:
			BuyButton.disabled = true
	GoButton.disabled = !PlayerStats.player_garage[current]
	GoButton.visible = PlayerStats.player_garage[current]
	PlayerMoney.text = "Coins: " + str(PlayerStats.player_money)

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


func _on_BuyButton_pressed():
	Confirm_popup.popup_centered()


func _on_Okay_pressed():
	PlayerStats.player_money -= Tables.cars_list[current]["cost"]
	PlayerStats.player_garage[current] = true
	update_screen()
	Confirm_popup.hide()
	PlayerStats.save_game()


func _on_Cancel_pressed():
	Confirm_popup.hide()


func _on_OkButton_pressed():
	PlayerStats.current_player_car = current
# warning-ignore:return_value_discarded
	get_tree().change_scene(Tables.levelData[str(PlayerStats.current_running_class)]["path"])
