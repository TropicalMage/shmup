extends Node2D

export (PackedScene) var projectile_resource

func shoot():
	var global = get_global_transform();
	shoot_bullet(global.origin, global.get_rotation()-PI/16)
	shoot_bullet(global.origin, global.get_rotation())
	shoot_bullet(global.origin, global.get_rotation()+PI/16)

func shoot_bullet(bullet_position, bullet_rotation):
	var bullet = projectile_resource.instance()
	bullet.set_position(bullet_position)
	bullet.set_rotation(bullet_rotation) 
	get_tree().get_root().get_node("/root").add_child(bullet)