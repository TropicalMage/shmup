extends Node2D

export (Vector2) var speed = Vector2(0,10)

func _physics_process(delta):
	var global = get_global_transform()
	var x = global.x * speed.x * delta
	var y = global.y * speed.y * delta
	get_parent().set_global_position(global.origin + x + y)