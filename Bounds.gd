extends Area2D

func _ready():
	connect("area_exited", self, "clean")
	
func clean(body):
	body.queue_free()