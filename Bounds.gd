extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("area_exited", self, "clean")
	
func clean(body):
	body.queue_free()