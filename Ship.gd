extends KinematicBody2D

export var default_position = Vector2(100, 100)
var speed = 500
var direction = Vector2(0, 0).normalized()

func _input(event):
	if (event.is_action_pressed("ui_up") || event.is_action_released("ui_down")):
		direction.y -= 1
		direction.normalized()
	if (event.is_action_pressed("ui_down") || event.is_action_released("ui_up")):
		direction.y += 1
		direction.normalized()
	if (event.is_action_pressed("ui_left") || event.is_action_released("ui_right")):
		direction.x -= 1
		direction.normalized()
	if (event.is_action_pressed("ui_right") || event.is_action_released("ui_left")):
		direction.x += 1
		direction.normalized()
	if (event.is_action_pressed("slowdown")):
		speed *= .5
	if (event.is_action_released("slowdown")):
		speed *= 2

func _physics_process(delta):
	move_and_collide(direction * speed * delta)

func reset():
	set_position(default_position)