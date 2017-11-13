extends Node2D

var player

func _ready():
	player = get_node("/root/Node2D/Player")
	var timer = Timer.new()
	timer.connect("timeout", self, "shoot")
	timer.set_wait_time(.3)
	timer.set_one_shot(false)
	timer.start()
	add_child(timer)

func _physics_process(delta):
	get_parent().set_rotation(get_global_position().angle_to_point(player.get_global_position())+PI/2)

func shoot():
	$Pattern.shoot()