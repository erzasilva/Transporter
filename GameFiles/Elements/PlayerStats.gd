extends Node

var current_player_car = 0
var player_money = 500
var player_garage = [true, false, false, false, false]
var map_stars = {}
var last_completed_class = 1
var last_completed_level = 0
var current_running_class = 1
var current_running_level = 0


func _ready():
	load_game()

func save_game():
	var save_data = {}
	save_data["money"] = player_money
	save_data["garage"] = player_garage
	save_data["class"] = last_completed_class
	save_data["level"] = last_completed_level
	save_data["level_data"] = save_stars_data()
	
	var save_file = File.new()
	save_file.open_encrypted_with_pass("user://save_file.json", File.WRITE, "BSPIGT")
	save_file.store_line(to_json(save_data))
	save_file.close()
	

func load_game():
	var save_file = File.new()
	if (save_file.open_encrypted_with_pass("user://save_file.json", File.READ, "BSPIGT") == OK):	
		var save_data = parse_json(save_file.get_line())
		save_file.close()
		player_money = save_data["money"]
		last_completed_class = save_data["class"]
		last_completed_level = save_data["level"]
		player_garage = save_data["garage"]
		load_star_data(save_data["level_data"])
		

func save_stars_data():
	var temp_i = {}
	for i in range(0, Tables.levelData.size()):
		var temp_j = {}
		for j in range(0, 10):
			if Tables.levelData[str(i)].has(str(j)):
				temp_j[str(j)] = Tables.levelData[str(i)][str(j)]["s"]
		temp_i[str(i)] = temp_j
	return temp_i


func load_star_data(level_data):
	for i in range(0, Tables.levelData.size()):
		for j in range(0, Tables.levelData[str(i)].size()):
			if Tables.levelData[str(i)].has(str(j)) and level_data[str(i)].has(str(j)):
				Tables.levelData[str(i)][str(j)]["s"] = level_data[str(i)][str(j)]

func last_code():
	return ((last_completed_class * 100) + last_completed_level + 1)
	
