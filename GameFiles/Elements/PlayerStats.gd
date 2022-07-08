extends Node

var current_player_car = 0
var player_money = 500
var player_garage = [true, false, false, false, false]
var last_completed_class = ""
var last_completed_level = 0
var current_running_class = "Test"
var current_running_level = 0


func _ready():
	load_game()
	print(player_garage)

func save_game():
	var save_data = {}
	save_data["money"] = player_money
	save_data["garage"] = player_garage
	save_data["class"] = last_completed_class
	save_data["level"] = last_completed_level
	
	var save_file = File.new()
	save_file.open_encrypted_with_pass("res://save_file.json", File.WRITE, "BSPIGT")
	save_file.store_line(to_json(save_data))
	save_file.close()
	

func load_game():
	var save_file = File.new()
	if (save_file.open_encrypted_with_pass("res://save_file.json", File.READ, "BSPIGT") == OK):	
		var save_data = parse_json(save_file.get_line())
		save_file.close()
		player_money = save_data["money"]
		player_garage = save_data["garage"]
		print(player_garage)
		last_completed_class = save_data["class"]
		last_completed_level = save_data["level"]
		
