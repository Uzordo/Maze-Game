extends StaticBody2D
class_name MainDoor

var entered: bool = false
@onready var collision_shape_2d = $CollisionShape2D

func _process(_delta):
		
	if Input.is_action_pressed("action") and entered:
		collision_shape_2d.disabled = true
		modulate = Color(0, 1, 0)
	
	
	if entered == false:
		collision_shape_2d.disabled = false
		modulate = Color("007F46")
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		entered = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		entered = false
