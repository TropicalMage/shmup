extends Area2D

var bullet_resource

func _ready():
	bullet_resource = load("res://bullet.tscn")
	var timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "fire")
	timer.set_wait_time(.1)
	timer.set_one_shot(false)
	timer.start()

func _physics_process(delta):
	set_rotation(get_rotation() + 1 * delta) 

func fire():
	shoot(get_position() + get_global_transform().y, get_rotation()-PI/16)
	shoot(get_position() + get_global_transform().y, get_rotation())
	shoot(get_position() + get_global_transform().y, get_rotation()+PI/16)
	
func shoot(bullet_position, bullet_rotation):
	var bullet = bullet_resource.instance()
	bullet.set_position(bullet_position)
	bullet.set_rotation(bullet_rotation) 
	get_tree().get_root().get_node("/root").add_child(bullet)