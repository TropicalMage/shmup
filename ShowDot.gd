extends CollisionShape2D

var show = false

func _input(event):
	if(event.is_action_pressed("slowdown")):
		show = true
		update()
	elif(event.is_action_released("slowdown")):
		show = false
		update()

func _draw():
	if(show):
		draw_circle(get_position(), get_shape().radius, Color(1,0,0,.5))