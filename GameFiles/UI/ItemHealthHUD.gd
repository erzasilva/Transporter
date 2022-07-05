extends HBoxContainer
var item_id

func set_details(id, item_name, health):
	item_id = id
	$ItemName.text = item_name
	$ProgressBar.max_value = health
	$ProgressBar.value = health
	
func update_health(health):
	$ProgressBar.value = health
