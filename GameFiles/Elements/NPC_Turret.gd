extends KinematicBody2D


var target
var player_detected = false
var can_fire = false
var bullet_speed = 5
var fire_rate = 1
var minimap_icon = "npc"

onready var projectile = load("res://Elements/Projectile.tscn")

var ProjectileLayer

func _ready():
	ProjectileLayer = get_tree().get_root().find_node("ProjectileLayer", true, false)
	get_tree().call_group("minimap", "add_marker", self)

func _on_DetectionRadius_body_entered(body):
	target = body
	player_detected = true
	can_fire = true
	


func _on_DetectionRadius_body_exited(_body):
	target = null
	player_detected = false
	can_fire = false
	$ShotTimer.stop()
	
func _process(_delta):
	if player_detected:
		look_at(target.position)
	if can_fire:
		fire()
	get_tree().call_group("minimap", "update_marker", self)

func fire():
	var temp = projectile.instance()
	temp.direction = (target.position - position).normalized()
	temp.position = $TurretBody/SpawnPoint.global_position
	temp.Speed = bullet_speed
	temp.life = fire_rate * 1.5
	temp.rotation = rotation
	$ShotTimer.start(fire_rate)
	can_fire = false
	ProjectileLayer.add_child(temp)


func _on_ShotTimer_timeout():
	can_fire = true
