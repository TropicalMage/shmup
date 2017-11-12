extends Node2D

func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().quit()

func _ready():
	var engine_resource = load("res://engine/LinearEngine.tscn")
	var enemy_resource = load("res://enemy/SpinnerEnemy.tscn")
	var gun_resource = load("res://guns/Tri Gun.tscn")
	
	var engine = engine_resource.instance()
	engine.set_position(Vector2(300, 100))
	add_child(engine)
	
	var enemy = enemy_resource.instance()
	engine.add_child(enemy)
	
	var gun = gun_resource.instance()
	gun.set_name("Gun")
	enemy.add_child(gun)