extends Node2D

export (Vector2) var linear_speed = 30
export (Vector2) var amplitude = 150
export (Vector2) var frequency = 3

var linear_pos
var counter = 0

func _ready():
	linear_pos = get_global_transform().origin

func _physics_process(delta):
	var global = get_global_transform()
	var linear_step = global.y * delta
	var curve_step = global.x * (sin(counter * frequency) * amplitude)
	linear_pos += linear_step * linear_speed
	get_parent().set_global_position(linear_pos + linear_step*linear_speed + curve_step)
	counter += delta