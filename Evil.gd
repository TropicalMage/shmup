extends KinematicBody2D

var bullet_resource

func _ready():
	bullet_resource = load("res://bullet.tscn")
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "fire")
	timer.set_wait_time(.25)
	timer.set_one_shot(false)
	timer.start()
	
func fire():
	var bullet = bullet_resource.instance()
	bullet.set_position(Vector2(0, 50))
	add_child(bullet)