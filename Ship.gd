extends KinematicBody2D

export var default_position = Vector2(100, 100)
var speed = 500
var direction = Vector2(0, 0).normalized()
var lives = 3

signal change_health(health)

var invincibility_timer
var shoot_delay
var current_pattern

func _ready():
	current_pattern = load("res://pattern/Single Pattern.tscn").instance()
	current_pattern.set_projectile_resource(load("res://projectile/Player Point Projectile.tscn"))
	add_child(current_pattern)
	
	invincibility_timer = Timer.new()
	invincibility_timer.set_wait_time(2)
	invincibility_timer.connect("timeout", self, "toggle_invicibility")
	add_child(invincibility_timer)
	
	shoot_delay = Timer.new()
	shoot_delay.set_wait_time(.1)
	shoot_delay.connect("timeout", current_pattern, "shoot")
	shoot_delay.set_one_shot(false)
	add_child(shoot_delay)

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
	if(event.is_action_pressed("shoot")):
		current_pattern.shoot()
		shoot_delay.start()
	if(event.is_action_released("shoot")):
		shoot_delay.stop()

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