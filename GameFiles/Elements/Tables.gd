extends Node




var item_list = [
	{"name" : "Parts", "id": 0, "health": 100, "exp": 100, "icon":"res://Assets/Items/gear.png" },
	{"name" : "Tools", "id": 1, "health": 50, "exp": 50, "icon": "res://Assets/Items/wrench.png"},
	{"name" : "Food", "id": 2, "health": 80, "exp": 50, "icon": "res://Assets/Items/shoppingCart.png"},
	{"name" : "Meds", "id": 3, "health": 80, "exp": 50, "icon": "res://Assets/Items/plus.png"},
	{"name" : "Meds", "id": 4, "health": 80, "exp": 50, "icon": "res://Assets/Items/plus.png"},
	]

var consume_list = [
	{"name": "health", "icon":"res://Assets/Items/plus.png", "health": 10, "damage": true, "speed": 0},
	{"name": "speed", "icon":"res://Assets/Items/trashcan.png", "health": 0, "damage": false, "speed": 0},
	{"name": "time", "icon":"res://Assets/Items/trashcan.png", "health": 0, "damage": true, "speed": 10}
]

var cars_list = [
	{"name": "Coupe", "icon": "res://Assets/RacePack/car_3.png", "slots": 1, "speed": 1.5, "cost": 0},
	{"name": "Sedan", "icon": "res://Assets/RacePack/car_1.png", "slots": 2, "speed": 0.6, "cost": 500},
	{"name": "Van", "icon": "res://Assets/RacePack/car_5.png", "slots": 4, "speed": 1, "cost": 1500},
	{"name": "Sports", "icon": "res://Assets/RacePack/car_2.png", "slots": 2, "speed": 2, "cost": 2500},
	{"name": "Truck", "icon": "res://Assets/RacePack/car_4.png", "slots": 6, "speed": 1.5, "cost": 4500},
]

var levelData = {
	"Test" : {
		"0" : {
		"p" : [2, -1, -1, -1, -1, -1, -1, -1, -1, -1],
		"d" : [-1, 2, -1, -1, -1, -1, -1, -1, -1, -1],
		"c" : [1, -1, -1, -1, -1],
		}
	}
}
