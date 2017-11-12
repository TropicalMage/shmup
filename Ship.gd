extends KinematicBody2D

export var default_position = Vector2(100, 100)
var speed = 500
var direction = Vector2(0, 0).normalized()
var lives = 3

signal change_health(health)

var invincibility_timer

func _ready():
	invincibility_timer = Timer.new()
	add_child(invincibility_timer)
	invincibility_timer.set_wait_time(2)
	invincibility_timer.connect("timeout", self, "toggle_invicibility")

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
	if(invincibility_timer.is_stopped()):
		invincibility_timer.start()
		get_node("CollisionShape2D").set_disabled(true)
		set_position(default_position)
		lives -= 1;
		emit_signal("change_health", lives)
		if(lives < 0):
			queue_free()

func toggle_invicibility():
	invincibility_timer.stop();
	get_node("CollisionShape2D").set_disabled(false)