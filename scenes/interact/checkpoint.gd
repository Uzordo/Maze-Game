extends Area2D

@onready var checkpoint_cords: Vector2 = Vector2(position.x, position.y)

func _on_body_entered(body):
	if body.name == "Player":
		body.change_spawn(checkpoint_cords)
