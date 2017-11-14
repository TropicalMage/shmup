extends Node2D

export (PackedScene) var projectile_resource setget set_projectile_resource

func shoot_projectile(projectile_position, projectile_rotation):
	var projectile = projectile_resource.instance()
	projectile.set_position(projectile_position)
	projectile.set_rotation(projectile_rotation)
	get_tree().get_root().get_node("/root").add_child(projectile)

func set_projectile_resource(new_projectile_resource):
	projectile_resource = new_projectile_resource