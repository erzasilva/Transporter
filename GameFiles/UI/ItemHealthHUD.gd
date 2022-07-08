extends VBoxContainer
var item_id
var item_health
func set_details(id, item_name, max_health, health):
	item_id = id
	$MarginContainer/ItemIcon.texture = load(Tables.item_list[id]["icon"])
	item_health = health
	$ProgressBar.max_value = max_health
	$ProgressBar.value = health
	
func update_health(health):
	item_health -= health
	$ProgressBar.value = item_health
	if item_health <= 0:
		queue_free()
