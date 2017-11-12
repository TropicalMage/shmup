extends Area2D

var speed = 200

func _ready():
	connect("body_entered", self, "impact")

func _physics_process(delta):
	set_position(get_position() + (get_global_transform().y * speed *  delta))

func impact(body):
	if (body.has_method("reset")):
		body.reset()
	queue_free()