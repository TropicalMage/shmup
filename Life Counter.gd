extends Label

func _ready():
	var player = get_node("/root/Node2D/Good")
	player.connect("change_health", self, "rekt")
	rekt(player.lives)
	
func rekt(health):
	set_text("Health: %d" % health)	