extends Node2D

var speed = 10

func _physics_process(delta):
	set_position(get_position() + (get_global_transform().y * speed *  delta))