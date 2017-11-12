extends Area2D

var speed = 200
var direction = Vector2(0, 1).normalized() setget set_direction

func _ready():
	connect("body_entered", self, "impact")

func _physics_process(delta):
	set_position(get_position() + (speed * direction * delta))

func set_direction(direction):
	direction = direction.normalized()

func impact(body):
	if (body.has_method("reset")):
		body.reset()
	queue_free()