extends Node2D

export (PackedScene) var projectile_resource

func shoot():
	var global = get_global_transform();
	shoot_bullet(global.origin + global.y, global.get_rotation()-PI/6)
	shoot_bullet(global.origin + global.y, global.get_rotation()-PI/4)
	shoot_bullet(global.origin + global.y, global.get_rotation()-PI/3)
	shoot_bullet(global.origin + global.y, global.get_rotation()-PI/2)
	shoot_bullet(global.origin + global.y, global.get_rotation()-2*PI/3)
	shoot_bullet(global.origin + global.y, global.get_rotation()-3*PI/4)
	shoot_bullet(global.origin + global.y, global.get_rotation()-5*PI/6)
	shoot_bullet(global.origin + global.y, global.get_rotation()+PI)
	shoot_bullet(global.origin + global.y, global.get_rotation()+PI/6)
	shoot_bullet(global.origin + global.y, global.get_rotation()+PI/4)
	shoot_bullet(global.origin + global.y, global.get_rotation()+PI/3)
	shoot_bullet(global.origin + global.y, global.get_rotation()+PI/2)
	shoot_bullet(global.origin + global.y, global.get_rotation()+2*PI/3)
	shoot_bullet(global.origin + global.y, global.get_rotation()+3*PI/4)
	shoot_bullet(global.origin + global.y, global.get_rotation()+5*PI/6)
	shoot_bullet(global.origin + global.y, global.get_rotation())
		
func shoot_bullet(bullet_position, bullet_rotation):
	var bullet = projectile_resource.instance()
	bullet.set_position(bullet_position)
	bullet.set_rotation(bullet_rotation) 
	get_node("/root").add_child(bullet)