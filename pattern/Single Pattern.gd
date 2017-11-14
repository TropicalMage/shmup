extends "Pattern.gd"

func shoot():
	var global = get_global_transform();
	shoot_projectile(global.origin, global.get_rotation())
