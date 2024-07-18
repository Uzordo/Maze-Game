extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@export var speed_timer: int = 1

var up_down: bool = true
	
@onready var timer_up = $TimerUp
@onready var timer_down = $TimerDown


func _ready():
	timer_up.wait_time = speed_timer
	timer_down.wait_time = speed_timer
	
	
	timer_up.start()
	
func _process(_delta):
	
	if up_down:
		collision_shape_2d.disabled = false
		timer_down.start()
		animated_sprite_2d.set_frame(1)
	else:
		collision_shape_2d.disabled = true
		timer_up.start()
		animated_sprite_2d.set_frame(0)
	
func _on_body_entered(body):
	if "hit" in body:
		body.hit()



func _on_timer_up_timeout():
	up_down = false


func _on_timer_down_timeout():
	up_down = true
