extends Path2D

@export var loop: bool = true
@export var speed: int = 2
@export var speed_scale: float  = 1.0

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer


func _ready():
	if not loop:
		animation.play("move")
		animation.speed_scale = speed_scale
		set_process(false)


func _process(delta):
	path.progress += speed * delta


func _on_animatable_body_2d_body_entered(body):
	if "hit" in body:
		body.hit()
