extends Node2D

var bullet_resource

func _ready():
	bullet_resource = load("res://bullet.tscn")

func shoot():
	var global = get_global_transform();
	shoot_bullet(global.origin + global.y, global.get_rotation()-PI/16)
	shoot_bullet(global.origin + global.y, global.get_rotation())
	shoot_bullet(global.origin + global.y, global.get_rotation()+PI/16)
	
func shoot_bullet(bullet_position, bullet_rotation):
	var bullet = bullet_resource.instance()
	bullet.set_position(bullet_position)
	bullet.set_rotation(bullet_rotation) 
	get_tree().get_root().get_node("/root").add_child(bullet)