extends Area2D

func _ready():
	connect("body_entered", self, "impact")
	connect("area_entered", self, "impact")
	
func impact(body):
	if (body.has_method("reset")):
		body.reset()
	queue_free()