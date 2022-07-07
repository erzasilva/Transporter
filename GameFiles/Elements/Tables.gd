extends Node

var item_list = [
	{"name" : "Parts", "id": 0, "health": 100, "exp": 100, "icon":"res://Assets/Items/gear.png" },
	{"name" : "Tools", "id": 1, "health": 50, "exp": 50, "icon": "res://Assets/Items/wrench.png"},
	{"name" : "Food", "id": 2, "health": 80, "exp": 50, "icon": "res://Assets/Items/shoppingCart.png"},
	{"name" : "Meds", "id": 3, "health": 80, "exp": 50, "icon": "res://Assets/Items/plus.png"},
	{"name" : "Meds", "id": 4, "health": 80, "exp": 50, "icon": "res://Assets/Items/plus.png"},
	]

var consume_list = [
	{"name": "test1", "icon":"res://Assets/Items/trashcan.png", "health": 10, "time": 0, "speed": 0},
	{"name": "test2", "icon":"res://Assets/Items/trashcan.png", "health": 0, "time": 10, "speed": 0},
	{"name": "test3", "icon":"res://Assets/Items/trashcan.png", "health": 0, "time": 0, "speed": 10}
]

var cars_list = [
	{"name": "Coupe", "icon": "res://Assets/RacePack/car_3.png", "slots": 1, "speed": 1.5, "info": "Name: Coupe\nDelivery Slots: 1\nSpeed: 150"},
	{"name": "Sedan", "icon": "res://Assets/RacePack/car_1.png", "slots": 2, "speed": 0.6, "info": "Name: Sedan\nDelivery Slots: 2\nSpeed: 60"},
	{"name": "Van", "icon": "res://Assets/RacePack/car_5.png", "slots": 4, "speed": 1, "info": "Name: Van\nDelivery Slots: 4\nSpeed: 100"},
	{"name": "Sports", "icon": "res://Assets/RacePack/car_2.png", "slots": 2, "speed": 2, "info": "Name: Sports\nDeliver Slots: 2\nSpeed: 200"},
	{"name": "Truck", "icon": "res://Assets/RacePack/car_4.png", "slots": 6, "speed": 1.5, "info": "Name: Truck\nDelivery Slots: 6\nSpeed: 150"},
]
