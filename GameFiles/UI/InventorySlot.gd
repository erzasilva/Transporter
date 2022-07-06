extends TextureRect

#main Variables
var pickup_id = -1
export var slot_location = 0

func _ready():
	$InventoryButton.disabled = true

func assign_slot(id):
	$InventoryButton.disabled = false
	pickup_id = id
	$TextureRect.texture = load(Tables.consume_list[pickup_id]["icon"])

func deassign_slot():
	pickup_id = -1
	$InventoryButton.disabled = true
	$TextureRect.texture = null

func _on_InventoryButton_pressed():
	var h = Tables.consume_list[pickup_id]["health"]
	var t = Tables.consume_list[pickup_id]["time"]
	var s = Tables.consume_list[pickup_id]["speed"]
	get_tree().call_group("ConsumeEffect", "use_consume", h, t, s, slot_location)
	deassign_slot()
