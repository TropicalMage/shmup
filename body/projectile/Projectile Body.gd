extends Area2D

func _ready():
	set_z(-10) 
	connect("body_entered", self, "impact")

func impact(body):
	if (body.has_method("reset")):
		body.reset()
	queue_free()