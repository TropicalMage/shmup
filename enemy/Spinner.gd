extends Area2D

func _ready():
	# set up timer to fire every .1 second
	var timer = Timer.new()
	timer.connect("timeout", self, "shoot")
	timer.set_wait_time(.1)
	timer.set_one_shot(false)
	timer.start()
	add_child(timer)

func _physics_process(delta):
	set_rotation(get_rotation() + 1 * delta)
	
func shoot():
	get_node("Gun").shoot()